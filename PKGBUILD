# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
pkgname=genwallet-git
pkgver=0.1.0.r1.d6f5c83
pkgrel=1
pkgdesc="Ethereum wallet generator with pattern matching"
arch=('x86_64' 'aarch64')
url="https://github.com/kewlfft/genwallet"
license=('GPL3')
makedepends=('rust' 'cargo')
source=("$pkgname::git+https://github.com/kewlfft/genwallet.git")
sha256sums=('SKIP')

pkgver() {
  printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  
  # Build with release optimizations
  cargo build --release --locked
  
  # Strip binary for smaller size
  strip target/release/genwallet
}

package() {
  cd "$pkgname"
  
  # Install binary
  install -Dm755 target/release/genwallet "$pkgdir/usr/bin/genwallet"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Create output directory
  install -dm755 "$pkgdir/var/lib/genwallet"
}