# Maintainer Nathan Fisher <jeang3nie at hitchhiker-linux dot org>
pkgname=eva-browser
pkgver=0.3.0
pkgrel=1
pkgdesc='A gemini browser in Gtk4'
arch=('x86_64')
url='https://codeberg.org/jeang3nie/eva'
license=('GPL3')
depends=('gtk4')
makedepends=('rust')
source=("https://codeberg.org/jeang3nie/eva/archive/v$pkgver.tar.gz")
sha512sums=(
  'b74630a1acd98678b24b967b696f2ec76c1260eacfe4879a042c861c431b49f0c34172095a58f038a775d92389cb6c1000f8ecae3e8abe7b0a75771e93150265'
)

build() {
  cd eva
  cargo build --release
  cargo xtask dist
}

package() {
  install -d $pkgdir/usr
  cd eva
  cp -R target/dist/* $pkgdir/usr
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}
