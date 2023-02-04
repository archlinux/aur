# Maintainer: Duale Siad <me@wale.id.au>
pkgname=gfh
pkgver=0.0.4
pkgrel=2
pkgdesc="Git FIDO Helper - Sign your Git commits with multiple resident SSH keys"
url="https://github.com/Ovyerus/gfh"
license=('MIT')

arch=('x86_64' 'armv7h' 'aarch64')
depends=('pcsclite' 'ccid') # Required for `gfh -a` to work
makedepends=('rust' 'cargo' 'git' 'openssl')

provides=("${pkgname}")
conflicts=("${pkgname}")

source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('4cd9d0e9ababcd925a2e865b1106e86cc4303296ba4733d335b097cef7755a24')

prepare() {
  echo -e "\x1b[1mInstallation note\x1b[0m: Enable \x1b[3mpcscd.service\x1b[0m to import your keys using gfh."
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #cargo install --root "${pkgdir}/usr" --path "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
