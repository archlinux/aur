pkgname=qt-hearts-git
pkgver=r7.9be0af8
pkgrel=1
pkgdesc="Classic hearts card game (development version)"
arch=('x86_64')
url="https://github.com/adelmonte/qt-hearts"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-svg' 'qt6-multimedia')
makedepends=('cmake' 'qt6-tools' 'git')
provides=('qt-hearts')
conflicts=('qt-hearts')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$pkgname"
    DESTDIR="$pkgdir" cmake --install build
}
