# Maintainer: Arisa Snowbell <goddess@chizuru.space>
pkgname=torcheck
pkgver=r1.266839a
pkgrel=1
pkgdesc="A very simple program that checks if your public endpoint IP address is Tor exit node"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Arisa_Snowbell/torcheck"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo' 'git')
_commit=266839a4fae4311c08b42a9bdb76c82f67ba041a
source=("git+https://gitlab.com/Arisa_Snowbell/torcheck.git#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('E2C998FA1F7B651E45B20CDC56AA2C2801F619D7' '93F4694364C3E688BA33E3E41CBE6B7A2B054E06' '4F9AC746631BB0BC52FAE73D3D526B3B3252C69E')
options=(!lto)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
