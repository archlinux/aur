# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hyperfine-git
pkgver=1.16.1.r4.g2763b41
pkgrel=2
pkgdesc="A command-line benchmarking tool"
arch=('i686' 'x86_64')
url="https://github.com/sharkdp/hyperfine"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("hyperfine=$pkgver")
conflicts=('hyperfine')
source=("git+https://github.com/sharkdp/hyperfine.git")
sha256sums=('SKIP')


prepare() {
  cd "hyperfine"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "hyperfine"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "hyperfine"

  #cargo test \
  #  --frozen
}

package() {
  cd "hyperfine"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/hyperfine"
  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/hyperfine"
}
