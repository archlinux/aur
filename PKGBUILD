# Maintainer: Arthur Sonzogni <sonzogniarthur@gmail.com>
pkgname=rtxui
pkgver=0.1.5
pkgrel=1
pkgdesc="C++ terminal user interfaces built from HTML templates, CSS and reactive state"
arch=('x86_64' 'aarch64')
url="https://github.com/ArthurSonzogni/RTXUI"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ArthurSonzogni/RTXUI/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a100c8b1e262e7b25a0bf94c949447a8c3094e54e0d36baf164fa52f3c57462b')

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
