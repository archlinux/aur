# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: Aaron DeVore <aaron.devore@gmail.com>

pkgname=xsv-git
pkgver=0.13.0.r12.g3de6c04
pkgrel=3
pkgdesc="A fast CSV command line toolkit written in Rust"
arch=('i686' 'x86_64')
url="https://github.com/BurntSushi/xsv"
license=('custom' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=('xsv')
conflicts=('xsv')
source=("git+https://github.com/BurntSushi/xsv.git")
sha256sums=('SKIP')


pkgver() {
  cd "xsv"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "xsv"

  cargo test \
    --locked \
    --release
}

package() {
  cd "xsv"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/xsv"
  install -Dm644 {LICENSE-MIT,UNLICENSE} -t "$pkgdir/usr/share/licenses/xsv"
}
