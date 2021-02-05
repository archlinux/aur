# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Contributor: Christopher Snowhill <chris@kode54.net>
# Contributor: Denis Zheleztsov <difrex.punk@gmail.com>

pkgname=wlr-randr
pkgver=0.2.0
pkgrel=1
pkgdesc="A xrandr clone for wlroots compositors"
arch=('x86_64')
url="https://github.com/emersion/wlr-randr"
license=('MIT')
depends=("wayland")
makedepends=("meson" "ninja")
source=("https://github.com/emersion/wlr-randr/releases/download/v$pkgver/wlr-randr-$pkgver.tar.gz"{,.sig})
sha256sums=('e1b60992e41aebf733f13c2bdd2c70375fd3ddf7f0735bc4183858fda9c18e51'
            'SKIP')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 $pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
