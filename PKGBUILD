# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=wapm
pkgver=0.5.0
pkgrel=1
pkgdesc="WebAssembly Package Manager"
arch=('x86_64')
url="https://wapm.io"
license=(MIT)
depends=('gcc-libs')
makedepends=('rust')
source=($pkgname-$pkgver.tar.gz::https://github.com/wasmerio/wapm-cli/archive/v${pkgver}.tar.gz)
sha512sums=('525be40c5b70073d7cbeb267af82414c6d02ef9af78d04c7c032bb17565ff67760070962975fc06edbca92148e7cb5a251e9a2f170b40e944c9ee582c5c7e101')

build() {
  cd "$srcdir/wapm-cli-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$srcdir/wapm-cli-$pkgver"

  cargo test
}

package() {
  cd "$srcdir/wapm-cli-$pkgver"

  install -Dm755 target/release/wapm "$pkgdir"/usr/bin/wapm
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
