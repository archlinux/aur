# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=dmos
pkgver=0.6.1
pkgrel=1
pkgdesc="Djot HTML renderer with advanced features"
arch=('x86_64')
url="https://sr.ht/~bitfehler/dmos"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'oniguruma')
makedepends=('rust' 'make' 'pkgconf' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/dmos/archive/$pkgver.tar.gz")
# build process with syntect (or inkjet) crate is a little... sensitive
sha512sums=('6ffcf24e4d5e05e6fa87a0e454fa2a9e3722ac9c1a2952a28953052085a5d370005eb1fad6f57bf48e1c8fbb75d99fa061ca86a65875367e8baf5198eee5bf9f')
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
