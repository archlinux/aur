# Maintainer: Mateusz Szychowski <mateusz@szychowski.it>
pkgname=budslink-git
pkgver=0.1.4.r8.ge603dbb
pkgrel=1
pkgdesc="Battery status and ANC control for several Bluetooth earbuds (git version)"
arch=('x86_64')
url="https://github.com/maniacx/BudsLink"
license=('GPL-3.0-or-later')
depends=('gjs' 'gtk4' 'libadwaita' 'bluez')
makedepends=('meson' 'git' 'gobject-introspection' 'gettext' 'glib2-devel')
provides=('budslink')
conflicts=('budslink')
source=("budslink-git::git+https://github.com/maniacx/BudsLink.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/budslink-git"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson budslink-git build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 budslink-git/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
