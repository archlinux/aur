# Maintainer: peeweep <peeweep at 0x0 dot ee>
# Contributor: Anatol Pomozov <anatol@google.com>

pkgname=muduo
pkgver=2.0.2
pkgrel=1
pkgdesc='A C++ non-blocking multi-threaded network library'
url='https://github.com/chenshuo/muduo'
license=(BSD)
arch=(i686 x86_64)
depends=(protobuf)
makedepends=(cmake boost)
options=(staticlibs)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('184d76c003b6b0d3081c35bd683feb708ac4fd48d2f93a23944817bb4d83ca60')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i '/-Werror/d' CMakeLists.txt
  sed -i 's/option(MUDUO_BUILD_EXAMPLES "Build Muduo examples" ON/option(MUDUO_BUILD_EXAMPLES "Build Muduo examples" OFF/' CMakeLists.txt
  INSTALL_DIR=/usr ./build.sh
}

package() {
  cd "${srcdir}/build/release-cpp11"
  make install DESTDIR="${pkgdir}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/License" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
