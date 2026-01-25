# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=dmos
pkgver=0.6.3
pkgrel=1
pkgdesc="Djot HTML renderer with advanced features"
arch=('x86_64')
url="https://sr.ht/~bitfehler/dmos"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'oniguruma')
makedepends=('rust' 'make' 'pkgconf' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/dmos/archive/$pkgver.tar.gz")
sha512sums=('24a920950f92c92d991edf59daecbe1e687533ad20ee2e19b5ad23b95236fe5d82c10903eac3f0b5b15e3f4b0b4ed4682f7fa5e9bde942ffa8595a677b24ce2e')
# build process with syntect (or inkjet) crate is a little... sensitive
options=('!buildflags')

build() {
  cd "dmos-$pkgver"

  export RUSTONIG_SYSTEM_LIBONIG=1
  cargo build --release --locked -p dmos-cli
  make -C man man
}

package() {
  cd "dmos-$pkgver"

  install -Dm755 "target/release/dmos" "$pkgdir/usr/bin/dmos"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "man/dmos.1.gz" "$pkgdir/usr/share/man/man1/dmos.1.gz"
}
