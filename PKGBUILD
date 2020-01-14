# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=cargo-asm
pkgver=0.1.16
pkgrel=2
pkgdesc="Cargo subcommand that shows the assembly or llvm-ir generated for Rust code"
url="https://github.com/gnzlbg/cargo-asm"
depends=('cargo' 'gcc-libs')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/cargo-asm/${pkgver}/download")
sha512sums=('653a34df95f627d992b8b6ccc561d401528bd73c5f7ae310a3e0dee53b0a243ec2525046b8542b224f8ce6f96f5841c870d61df6633021f7dc03a79dad208445')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/cargo-asm" "target/release/cargo-llvm-ir" -t "$pkgdir/usr/bin/"
  install -Dm644 license-mit.md license-apache.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
