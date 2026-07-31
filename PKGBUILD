# Maintainer: Marek Samec
pkgname=qtmsgreader-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A Qt-based application for reading Microsoft Outlook MSG files"
arch=('x86_64')
url="https://github.com/mareksamec/qt-msg-reader"
license=('MIT')
depends=('qt6-base')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Placeholder until a matching v$pkgver tag exists upstream - run
# `updpkgsums` (pacman-contrib) to fill in the real checksum before
# submitting/updating this package on the AUR.
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
