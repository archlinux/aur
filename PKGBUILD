# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=sticky
pkgver=1.20
pkgrel=2
pkgdesc="A sticky notes app for the Linux desktop"
arch=('any')
url="https://github.com/linuxmint/sticky"
license=('GPL2')
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
sha256sums=('3f95351e82b916e7d89ec707e9e327231e8fc63b36740c32561b27242d6c009d')

prepare() {
    cd "$pkgname-$pkgver"

    # Set version in About dialog
    sed -i "s/__DEB_VERSION__/${pkgver//+*/}/g" "usr/lib/$pkgname/$pkgname.py"

    # Fix license path
    sed -i 's|common-licenses/GPL|licenses/common/GPL/license.txt|g' \
      "usr/lib/$pkgname/$pkgname.py"
}

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
