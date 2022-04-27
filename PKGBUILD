# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=fleet
pkgver=r95.4273ea8
pkgrel=1
pkgdesc='Experimental build tool for Rust'
arch=('x86_64')
url='https://fleet.rs'
license=('Apache')
depends=('sccache' 'rustup' 'lld' 'clang')
makedepends=('git')
options=('!lto')
_commit='4273ea8d3bda31c1f6b27f132312bff6d0f0e985'
source=("$pkgname::git+https://github.com/dimensionhq/fleet.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"

  RUSTUP_TOOLCHAIN=nightly cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  
  RUSTUP_TOOLCHAIN=nightly cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" target/release/fleet
}
