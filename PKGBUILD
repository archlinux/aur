# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="sen"
pkgver=0.7.0
pkgrel=1
pkgdesc="Terminal User Interface for containers"
arch=('any')
url="https://github.com/TomasTomecek/${pkgname}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
# checkdepends=('python-pytest>=3.4.0' 'python-flexmock')
depends=('python' 'python-urwid' 'python-docker' 'python-urwidtrees')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a4a076b0c69c7cdc2d09d21ae8e8df6b79b237ad7c6f4f298089c71b71558095')

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

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/${_pkgsrc}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
