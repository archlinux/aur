# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cavif-git
pkgver=1.3.1.win.r13.gb0a2d76
pkgrel=2
pkgdesc="AVIF image creator in pure Rust"
arch=('i686' 'x86_64')
url="https://lib.rs/crates/cavif"
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'nasm' 'rust')
provides=('cavif')
conflicts=('cavif')
source=("git+https://github.com/kornelski/cavif-rs.git")
sha256sums=('SKIP')


pkgver() {
  cd "cavif-rs"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/-/./'
}

check() {
  cd "cavif-rs"

  #cargo test \
  #  --release
}

package() {
  cd "cavif-rs"

  cargo install \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/cavif-rs"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/cavif"
}
