# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=telegraph
pkgdesc='Write and decode morse'
pkgver=0.1.6
pkgrel=2
arch=('any')
url="https://github.com/fkinoshita/Telegraph"
license=('GPL3')
depends=('python' 'libadwaita')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson Telegraph build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlog
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 Telegraph/README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 Telegraph/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
