# Maintainer: soloturn@gmail.com

pkgname=gossip-git
pkgver=r725.e39e48e
pkgrel=1
pkgdesc="gossip nostr client, rust, egui based."
arch=('x86_64')
url="https://github.com/mikedilger/gossip"
license=(MIT)
makedepends=(cargo)
provides=($pkgname)
conflicts=($pkgname)
options=(!lto)
source=(
  "$pkgname::git+https://github.com/mikedilger/gossip.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  #RUSTFLAGS="-C link-arg=--ld-path=/usr/bin/mold target-cpu=native --cfg tokio_unstable"
  RUSTFLAGS="-C link-arg=--ld-path=/usr/bin/mold"
  nice cargo build --release
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" just install
}
