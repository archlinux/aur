# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=desktop-files-creator
pkgver=1.2.4
pkgrel=1
pkgdesc='Simple app to create desktop files on GNU/Linux'
url=https://github.com/alexkdeveloper/$pkgname
arch=(any)
license=(GPL3)
depends=(libadwaita)
checkdepends=(appstream-glib)
makedepends=(git meson vala)
source=(git+$url#tag=$pkgver)
b2sums=('SKIP')

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
