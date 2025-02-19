# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=dmos
pkgver=0.5.0
pkgrel=1
pkgdesc="Djot HTML renderer with advanced features"
arch=('x86_64')
url="https://sr.ht/~bitfehler/dmos"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/dmos/archive/$pkgver.tar.gz")
sha512sums=('fdd8702617299671f5b0988b18929f07555206f5f7745b6fc679e2d84b56c4f3fb022df2e73fc7efafe46536cc63408c78d7c5c41a4864d18fb7f20da2a9b231')
# build process with syntect (or inkjet) crate is a little... sensitive
options=('!buildflags')

build() {
  cd "dmos-$pkgver"

  cargo build --release --locked -p dmos-cli
}

package() {
  cd "dmos-$pkgver"

  install -Dm755 "target/release/dmos" "$pkgdir/usr/bin/dmos"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
