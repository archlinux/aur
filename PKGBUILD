# Maintainer: Allen Choong <allen.choong at gmail dot com>
pkgname=prayer-clock
pkgver=5.0.0.5.gcf185ce
pkgrel=1
pkgdesc="Catholic prayers reminder, contains Angelus and 3 O'clock Prayer"
url='https://github.com/allencch/prayer-clock'
arch=('i686' 'x86_64')
license=('BSD')
depends=('qt6-base')
makedepends=('git' 'cmake' 'qt6-tools')
source=("${pkgname}::git+https://github.com/allencch/prayer-clock.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "%s" "$(git describe --tags | sed 's/^v//;s/-/./g')"
}

build() {
    cd "$srcdir/$pkgname"
    cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}"
    cmake --install build --prefix "$pkgdir/usr"
    install -Dm644 "res/prayer-clock.desktop" "$pkgdir/usr/share/applications/prayer-clock.desktop"
    install -Dm644 "res/prayer-clock.png" "$pkgdir/usr/share/pixmaps/prayer-clock.png"
    install -Dm644 "res/prayers.xml" "$pkgdir/usr/share/prayer-clock/prayers.xml"
}
