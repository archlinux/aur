# Maintainer: Ivan Kuznetsov <ivan@ikuznetsov.com>
pkgname=writero-desktop
pkgver=0.1.0
pkgrel=1
pkgdesc="Native block editor with AI writing tools and local-first documents"
arch=('x86_64' 'aarch64')
url="https://github.com/ivankuznetsov/writero-desktop"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'libsecret' 'sqlite')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ivankuznetsov/writero-desktop/releases/download/v$pkgver/writero-desktop-$pkgver.tar.gz")
sha256sums=('f8e0267053e0e0a285aceab990e94ecebe56010035d442a70dfc335f59a16b87')

build() {
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -S "$pkgname-$pkgver"
    cmake --build build
}

check() {
    QT_QPA_PLATFORM=offscreen ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build --prefix /usr
}
