# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="picotui"
pkgname="python-${_name}"
pkgver=1.2.1
_commit="eea5113fcf95f4340cd6139bf63697baefc7b17b"
pkgrel=1
pkgdesc="Lightweight, pure-Python Text User Interface (TUI) widget toolkit"
arch=('any')
url="https://github.com/pfalcon/${_name}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
# checkdepends=('python-pytest')
depends=('python')
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('00fc2fe6e9bc46589777596649e6c8510bbbc76a3aaadae12bf78c1df5e35b95')

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
  ln -s "${pkgdir}${site_packages}/${_name}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
