# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=chromatic
pkgdesc='Fine-tune your instruments'
pkgver=0.1.2
pkgrel=1
arch=('any')
url="https://github.com/nate-xyz/chromatic"
license=(GPL3)
depends=('libadwaita')
makedepends=('cargo' 'git' 'meson')
checkdepends=('appstream-glib')
_commit=fe9d34e3cb30a045b95aa76f8cc4e3193903e262
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  sed -i "s/'validate'/'validate-relax'/" ${pkgname}/data/meson.build
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlog
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 $pkgname/README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 $pkgname/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
