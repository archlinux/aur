# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=dmos
pkgver=0.3.0
pkgrel=1
pkgdesc="Djot HTML renderer with advanced features"
arch=('x86_64')
url="https://sr.ht/~bitfehler/dmos"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/dmos/archive/$pkgver.tar.gz")
sha512sums=('aa0f75851c27f917906b91993e4500f327c7b860974c439d380719cc61d1e69babf17509d119fb0c11e926045f827f8ffb9afd0dba1468be1c55e51d2caf9d28')
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
