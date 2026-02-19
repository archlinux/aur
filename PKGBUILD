# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hyperfine-git
pkgver=1.20.0.r1.g327d5f4
pkgrel=1
pkgdesc="A command-line benchmarking tool"
arch=('i686' 'x86_64')
url="https://github.com/sharkdp/hyperfine"
license=('Apache-2.0' 'MIT')
depends=('glibc' 'libgcc')
makedepends=('git' 'cargo')
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
