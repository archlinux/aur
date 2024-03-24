# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=desktop-files-creator
pkgver=1.2.6
pkgrel=1
pkgdesc='Simple app to create desktop files on GNU/Linux'
url=https://github.com/alexkdeveloper/$pkgname
arch=(any)
license=(GPL3)
depends=(libadwaita)
checkdepends=(appstream-glib)
makedepends=(git meson vala)
source=(git+$url#tag=$pkgver)
b2sums=('bb56b32e8fe554fa7c1e2f4bf51a5cddc29da20341536a2fc7650f4f37ff0863d4d1830f3001efdc369bd3cce797a0ede21d301b4be679685f347fb586e5b23b')

prepare() {
        sed -i "s/'validate'/'validate-relax'/" $pkgname/data/meson.build
}

build() {
        arch-meson $pkgname build
        meson compile -C build
}

check() {
        meson test -C build --print-errorlogs
}

package() {
        meson install -C build --destdir "$pkgdir"
}
