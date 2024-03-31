# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=desktop-files-creator
pkgver=1.2.7
pkgrel=1
pkgdesc='Simple app to create desktop files on GNU/Linux'
url=https://github.com/alexkdeveloper/$pkgname
arch=(any)
license=(GPL3)
depends=(libadwaita)
checkdepends=(appstream-glib)
makedepends=(git meson vala)
source=(git+$url#tag=$pkgver)
b2sums=('0cca6c841977bcd3016fe4141015cafce42ff2b6bfb4db2678a1513211b04a1a9735b204c7ed93e14de6a0dc22e3c4381bd9bf52b44f084cc1b8816534b3883a')

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
