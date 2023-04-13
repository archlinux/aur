# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=telegraph
pkgdesc='Write and decode morse'
pkgver=0.1.4
pkgrel=1
arch=('any')
url="https://github.com/fkinoshita/Telegraph"
license=(GPL3)
depends=('python' 'libadwaita')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
_commit=d0fbf7d0ad7ef59a71a4fce12503a0faadfa6894
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
