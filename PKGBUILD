# Maintainer: Ivan Kuznetsov <ivan@ikuznetsov.com>
#
# pkgver and sha256sums track the latest release. The tag-driven release
# workflow overrides both from the tag and its attached source tarball
# before publishing, so a stale value here never reaches the AUR.
pkgname=writero-desktop
pkgver=0.1.1
pkgrel=1
pkgdesc="Native block editor with AI writing tools and local-first documents"
arch=('x86_64' 'aarch64')
url="https://github.com/ivankuznetsov/writero-desktop"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'libsecret' 'sqlite')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ivankuznetsov/writero-desktop/releases/download/v$pkgver/writero-desktop-$pkgver.tar.gz")
sha256sums=('68629d116c083efa19a2ded4d346058ba20f0d604f9d3687bddf785bc51cac9c')

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
