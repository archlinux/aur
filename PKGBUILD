_pkgbasename=jsoncpp
pkgname=lib32-${_pkgbasename}
pkgver=1.8.0
pkgrel=1
pkgdesc='A C++ library for interacting with JSON'
url='https://github.com/open-source-parsers/jsoncpp'
license=('MIT' 'custom:Public_Domain')
arch=('x86_64')
depends=("${_pkgbasename}" 'lib32-gcc-libs')
makedepends=('cmake')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/open-source-parsers/${_pkgbasename}/archive/${pkgver}.tar.gz")
sha256sums=('5deb2462cbf0c0121c9d6c9823ec72fe71417e34242e3509bc7c003d526465bc')

build() {
  cd ${_pkgbasename}-${pkgver}
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DCMAKE_CXX_FLAGS=-m32 \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_STATIC_LIBS=OFF
  make
}

check() {
  cd ${_pkgbasename}-${pkgver}
  make test
}

package() {
  cd  ${_pkgbasename}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  rm -rf "${pkgdir}"/usr/include
}

