# Maintainer: roehistat <mail at iyxeyl.me>

pkgname=prex
pkgver=0.5.5
pkgrel=1
pkgdesc="Run Windows executables in Steam Proton prefixes"
arch=('x86_64')
url="https://github.com/eyenalxai/${pkgname}"
license=('GPL3')
depends=('gcc-libs' 'sqlite')
makedepends=('cargo')
options=('!debug' 'strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a23abb178383c2567d875c72fe01bacb48d0e227a0db4819211df8dd8589e6c6')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
