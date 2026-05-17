# Maintainer: Codestation <codestation@megpoid.dev>

pkgname=peru-dnie-pkcs11
pkgver=0.1.1
pkgrel=1
pkgdesc="PKCS#11 module for Peruvian DNIe card-bound PDF signing"
arch=('x86_64')
url="https://github.com/codestation/peru-dnie-pkcs11"
license=('MIT OR Apache-2.0')
depends=('openssl' 'pcsclite')
makedepends=('cargo' 'pkgconf' 'rust')
optdepends=('opensc: pkcs11-tool smoke tests')
source=("$pkgname::git+https://github.com/codestation/peru-dnie-pkcs11.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 target/release/libperu_dnie_pkcs11.so \
    "$pkgdir/usr/lib/libperu_dnie_pkcs11.so"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 LICENSE-MIT \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
