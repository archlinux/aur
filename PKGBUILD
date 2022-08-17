# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=m3u8
pkgname=python-${_base}
pkgdesc="Python m3u8 parser"
pkgver=3.2.0
pkgrel=2
arch=(any)
url="https://github.com/globocom/${_base}"
license=(MIT)
depends=(python-iso8601)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-bottle)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('d46935bb1a050512c7a127825e8006f34f3aabad3ec96e8ebe4ce0d6ad71931e5d9b26c920fc6e08d6c9d2c7802f70970e96c977fdb2dadca79a396e76823fb2')

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
