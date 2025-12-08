# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=ultimate-tic-tac-toe-git
pkgver=1.1.0.r8.geb6a4c6
pkgrel=1
pkgdesc="Ultimate Tic Tac Toe - GTK4/libadwaita Python game"
arch=('any')
url="https://github.com/Nokse22/ultimate-tic-tac-toe"
license=('GPL-3.0-or-later')
depends=('python-gobject' 'gtk4' 'libadwaita')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'python-setuptools' 'python-pip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "$pkgname"
    meson setup build --prefix=/usr --localstatedir=/var --buildtype=release
    ninja -C build
}

package() {
    cd "$pkgname"
    DESTDIR="${pkgdir}" ninja -C build install
}
