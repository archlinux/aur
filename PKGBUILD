# Maintainer: Anatol Pomozov <anatol@google.com>

pkgname=muduo
pkgver=2.0.0
pkgrel=1
pkgdesc='A C++ non-blocking multi-threaded network library'
url='https://github.com/chenshuo/muduo'
license=(BSD)
arch=(i686 x86_64)
depends=(protobuf)
makedepends=(cmake boost)
options=(staticlibs)
source=(muduo-$pkgver.zip::https://github.com/chenshuo/muduo/archive/v$pkgver.zip)
sha1sums=('ba73e559a060479550167694e6b939a97ea6fec4')

build() {
  cd muduo-$pkgver
  sed -i '/-Werror/d' CMakeLists.txt
  sed -i 's/option(MUDUO_BUILD_EXAMPLES "Build Muduo examples" ON/option(MUDUO_BUILD_EXAMPLES "Build Muduo examples" OFF/' CMakeLists.txt
  INSTALL_DIR=/usr ./build.sh
}

package() {
  cd build/release-cpp11
  make install DESTDIR="$pkgdir"
  install -Dm644 "${srcdir}/${pkgname}-$pkgver/License" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
