# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=sticky
pkgver=1.22
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
sha256sums=('27dbed60d31fa409c5c7fb82293e424fdd9692c8c6c98ae60c7e1ec9bbac2f23')

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
