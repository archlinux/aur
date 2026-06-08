pkgname=email-cli-lightjunction
pkgver=0.1.0
pkgrel=1
pkgdesc='Rust email CLI with Gmail OAuth and generic IMAP/SMTP support'
arch=('x86_64')
url='https://github.com/LIghtJUNction/email-cli'
license=('MIT' 'Apache-2.0')
depends=('openssl')
makedepends=('cargo')
options=('!lto')
source=("https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('d887a851cc92816c5e87cdb81848ed57307088f6e7bfd19b221a914f500c652b')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release --locked
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/email "$pkgdir/usr/bin/email"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
