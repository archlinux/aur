# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="picotui"
pkgname="python-${_name}"
pkgver=1.1
pkgrel=1
pkgdesc="Lightweight, pure-Python Text User Interface (TUI) widget toolkit"
arch=('any')
url="https://github.com/pfalcon/${_name}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
# checkdepends=('python-pytest')
depends=('python')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fe2b879f5c00bcdaf8bda49638df3cc198ef4670d3d5aa0b79b71bbd4a0f1122')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

# check () {
#   cd "${srcdir}/${_pkgsrc}"
#   pytest
# }

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/${_pkgsrc}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
