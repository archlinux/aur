# Maintainer: Frederick Martel
pkgname=aspm27-server
pkgver=0.2.1
pkgrel=1
pkgdesc="Server component of aspm - a slick, modern messenger focused on simplicity, security and speed"
arch=('x86_64' 'aarch64')
url="https://github.com/fredima2x/aspm27"
license=('custom')
depends=('sqlite' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fredima2x/aspm27/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "aspm27-$pkgver/server"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --locked
}

package() {
  cd "aspm27-$pkgver"
  install -Dm755 "server/target/release/server" "$pkgdir/usr/bin/aspm27-server"
  install -Dm644 "docs/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
