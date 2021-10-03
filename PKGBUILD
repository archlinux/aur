# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Contributor: Christopher Snowhill <chris@kode54.net>
# Contributor: Denis Zheleztsov <difrex.punk@gmail.com>

pkgname=wlr-randr-git
pkgver=v0.2.0+1+gfb31752
pkgrel=1
pkgdesc="Utility to manage outputs of a Wayland compositor (latest git version)"
arch=('x86_64')
url="https://github.com/emersion/wlr-randr"
license=('MIT')
depends=("wayland")
makedepends=("git" "meson")
provides=("wlr-randr")
conflicts=("wlr-randr")
source=("$pkgname::git+https://git.sr.ht/~emersion/wlr-randr")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
