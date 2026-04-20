# Maintainer: T9Tuco <fabiostaab12@gmail.com>
pkgname=archvital-git
pkgver=r1.d5ea010
pkgrel=1
pkgdesc="Qt6/C++20 system monitor for Arch Linux"
arch=('x86_64')
url="https://github.com/T9Tuco/archvital"
license=('MIT')
depends=('qt6-base')
makedepends=('cmake' 'gcc')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/archvital.desktop" \
        "$pkgdir/usr/share/applications/archvital.desktop"
    install -Dm644 "$pkgname/assets/archvital.svg" \
        "$pkgdir/usr/share/pixmaps/archvital.svg"
}
