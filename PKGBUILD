# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>

pkgname=reclog
_pkgname=reclog
pkgver=0.1.5
pkgrel=1
pkgdesc="Command-line tool to capture command output to a file."
url="https://github.com/gavv/reclog"
makedepends=('cargo')
depends=('glibc' 'gcc-libs')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_pkgname/$pkgver/download")
sha256sums=('912b2119b4e6a9a757e6646a24c70524bc45014bc64d86adca367090382ae474')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

}



build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname-$pkgver"
   install -Dm755 target/release/reclog "$pkgdir/usr/bin/reclog"
   install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
   install -Dm644 "reclog.1" "$pkgdir/usr/share/man/man1/reclog.1"

 }
