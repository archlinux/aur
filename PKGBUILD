# Maintainer: Arthur Sonzogni <sonzogniarthur@gmail.com>
pkgname=rtxui
pkgver=0.1.4
pkgrel=1
pkgdesc="C++ terminal user interfaces built from HTML templates, CSS and reactive state"
arch=('x86_64' 'aarch64')
url="https://github.com/ArthurSonzogni/RTXUI"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ArthurSonzogni/RTXUI/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8f1d22342dce4160d99576b7653bb511c7d3d74aabadf9064493fb816d669707')

build() {
  cmake -S "RTXUI-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DRTXUI_BUILD_TESTS=OFF \
    -DRTXUI_BUILD_EXAMPLES=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "RTXUI-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
