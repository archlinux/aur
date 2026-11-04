# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname=rusthound-ce
pkgver=2.5.40
pkgrel=1
pkgdesc="BloodHound CE collector written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/g0h4n/$pkgname"
license=('MIT')
depends=(
  'glibc'
  'libgcc'
  'krb5'
)
makedepends=(
  'rust'
  'git'
)
source=("git+$url#tag=v$pkgver")
b2sums=('9620e6e84e131efb4d56cb6626e6b2e0f7f31e42dbd4675c9c28eb82f70a6785d351a07c97c9b8b2fbfdb9e9c0033a027ed9dc2559aabebb2ae5675289c8767a')
options=('!lto')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo b -r --frozen
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo t -r --frozen --no-fail-fast
}

package() {
  cd "$pkgname"
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 syntax=PKGBUILD et:
