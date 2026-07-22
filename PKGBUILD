# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=herdr-workspace-manager
_srcname=herdr-plugin-workspace-manager
pkgver=0.5.0
pkgrel=1
pkgdesc="CLI for the herdr Workspace Manager plugin - declarative worktree layouts and gone-worktree cleanup"
arch=('x86_64')
url="https://github.com/razajamil/herdr-plugin-workspace-manager"
license=('MIT')
depends=('git' 'gcc-libs')
makedepends=('cargo')
optdepends=('herdr: plugin host for the layout side (install the plugin with: herdr plugin install razajamil/herdr-plugin-workspace-manager)')
source=("$_srcname-$pkgver.tar.gz::https://github.com/razajamil/$_srcname/archive/v$pkgver.tar.gz")
sha256sums=('124df150b88a23c977c25e65d3acadedf9486e5a6b376864625b6674d9237335')

prepare() {
  cd "$_srcname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_srcname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$_srcname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
