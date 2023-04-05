# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=oxipng-git
pkgver=8.0.0.r6.gcc37f645
pkgrel=1
pkgdesc="Multithreaded PNG optimizer"
arch=('i686' 'x86_64')
url="https://github.com/shssoichiro/oxipng"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("oxipng=$pkgver")
conflicts=('oxipng')
source=("git+https://github.com/shssoichiro/oxipng.git")
sha256sums=('SKIP')


prepare() {
  cd "oxipng"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "oxipng"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "oxipng"

  #cargo test \
  #  --frozen
}

package() {
  cd "oxipng"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/oxipng"
}
