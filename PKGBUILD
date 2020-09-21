# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Contributor: Christopher Snowhill <chris@kode54.net>
# Contributor: Denis Zheleztsov <difrex.punk@gmail.com>

pkgname=wlr-randr
pkgver=0.1.0
pkgrel=2
pkgdesc="A xrandr clone for wlroots compositors"
arch=('x86_64')
url="https://github.com/emersion/wlr-randr"
license=('MIT')
depends=("wayland")
makedepends=("meson" "ninja")
source=("https://github.com/emersion/wlr-randr/releases/download/v$pkgver/wlr-randr-$pkgver.tar.gz"{,.sig})
sha256sums=('dbf2f02aa4d4f48dc9cef1edd1137a8ee68daa85f3c824a28c92376fd1591844' 'SKIP')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 $pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
