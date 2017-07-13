_pkgbasename=jsoncpp
pkgname=lib32-${_pkgbasename}
pkgver=1.8.1
pkgrel=1
pkgdesc='A C++ library for interacting with JSON'
url='https://github.com/open-source-parsers/jsoncpp'
license=('MIT' 'custom:Public_Domain')
arch=('x86_64')
depends=("${_pkgbasename}" 'lib32-gcc-libs')
makedepends=('cmake')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/open-source-parsers/${_pkgbasename}/archive/${pkgver}.tar.gz")
sha256sums=('858db2faf348f89fdf1062bd3e79256772e897e7f17df73e0624edf004f2f9ac')

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

