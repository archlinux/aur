# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hyperfine-git
pkgver=1.9.0.r36.gb702292
pkgrel=2
pkgdesc="A command-line benchmarking tool"
arch=('i686' 'x86_64')
url="https://github.com/sharkdp/hyperfine"
license=('apache' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=('hyperfine')
conflicts=('hyperfine')
source=("git+https://github.com/sharkdp/hyperfine.git")
sha256sums=('SKIP')


pkgver() {
  cd "hyperfine"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "hyperfine"

  #cargo test \
  #  --locked \
  #  --release
}

package() {
  cd "hyperfine"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/hyperfine"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/hyperfine"
  install -Dm644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/hyperfine"
  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/hyperfine"
}
