# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=lqth-git
_pkgname=lqth
pkgver=0.2.4
pkgrel=1
epoch=
pkgdesc="Simple but blazingly fast screenshot utility"
arch=(x86_64)
url="https://github.com/0x61nas/lqth"
license=('MIT')
makedepends=(cargo libx11)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git#branch=aurora")
sha256sums=(SKIP)


pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}

