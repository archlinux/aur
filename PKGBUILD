# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=telegraph
pkgdesc='Write and decode morse'
pkgver=0.1.5
pkgrel=1
arch=('any')
url="https://github.com/fkinoshita/Telegraph"
license=(GPL3)
depends=('python' 'libadwaita')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
_commit=3885f03e3c0263bc343034137f15f7a80558bbba
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson Telegraph build
  ninja -C build
}

check() {
  meson test -C build --print-errorlog
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 Telegraph/README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 Telegraph/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
