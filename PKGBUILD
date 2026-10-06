# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname="rusthound-ce"
pkgver=2.5.23
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
b2sums=('2775f43d1139482b26d427c36375c40fb6644654248dfc727d89481c07bd6f6559b1a861e14ca5d794c0ba6360e55e59663355a05993e61bc414a577a826286f')
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
  cargo b --frozen -r
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo t --frozen --no-fail-fast -r
}

package() {
  cd "$pkgname"
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 syntax=PKGBUILD et:
