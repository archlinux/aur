# Maintainer Nathan Fisher <jeang3nie at hitchhiker-linux dot org>
pkgname=eva-browser
pkgver=0.4.1
pkgrel=1
pkgdesc='A gemini browser in Gtk4'
arch=('x86_64')
url='https://codeberg.org/jeang3nie/eva'
license=('GPL3')
depends=('gtk4')
makedepends=('rust')
source=("https://codeberg.org/jeang3nie/eva/archive/v$pkgver.tar.gz")
sha512sums=(
  '3841a9a26efc842b65a585c2a573498a0389b0c0b38bc1afbd60f630f4d68685ba34276c6fa1efa1cd70739a9c649edeba1a030ed38122409d66c0fbf7731754'
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
