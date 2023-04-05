# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: Aaron DeVore <aaron.devore@gmail.com>

pkgname=xsv-git
pkgver=0.13.0.r13.g4278b85
pkgrel=1
pkgdesc="A fast CSV command line toolkit written in Rust"
arch=('i686' 'x86_64')
url="https://github.com/BurntSushi/xsv"
license=('custom' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("xsv=$pkgver")
conflicts=('xsv')
source=("git+https://github.com/BurntSushi/xsv.git")
sha256sums=('SKIP')


prepare() {
  cd "xsv"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "xsv"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "xsv"

  #cargo test \
  #  --frozen
}

package() {
  cd "xsv"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 {LICENSE-MIT,UNLICENSE} -t "$pkgdir/usr/share/licenses/xsv"
}
