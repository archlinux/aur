# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=sticky
pkgver=1.21
pkgrel=1
pkgdesc="A sticky notes app for the Linux desktop"
arch=('any')
url="https://github.com/linuxmint/sticky"
license=(''GPL-2.0-or-later'')
#groups=('x-apps')
depends=(
    'gtk3'
    'gspell'
    'python-gobject'
    'python-xapp'
    'xapp'
)
makedepends=(
    'meson'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d6e44c4d7cc506859eca95333d7ce355fbcd59618975806bd27d032c40f43553')

prepare() {
    cd "$pkgname-$pkgver"

    # Set version in About dialog
    sed -i "s/__DEB_VERSION__/${pkgver//+*/}/g" "usr/lib/$pkgname/$pkgname.py"

    # Fix license path
    sed -i 's|common-licenses/GPL|licenses/spdx/GPL-2.0-or-later.txt|g' \
      "usr/lib/$pkgname/$pkgname.py"
}

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
