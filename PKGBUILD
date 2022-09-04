# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=m3u8
pkgname=python-${_base}
pkgdesc="Python m3u8 parser"
pkgver=3.3.0
pkgrel=1
arch=(any)
url="https://github.com/globocom/${_base}"
license=(MIT)
depends=(python-iso8601)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-bottle)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('b0e3580b6cba2bbd3b0dcbdfefd69f807c947f1f27f8005d256be079e299281df74c2a216cdc2ea1eb72539cfd8bf05ea0806bec6538ccc3b2f1b7f4017d0b3a')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest tests -k 'not load_should_create_object_from_uri and not load_should_remember_redirect and not load_should_create_object_from_uri_with_relative_segments'
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
