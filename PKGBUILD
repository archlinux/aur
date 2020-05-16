# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=oxipng-git
pkgver=3.0.0.r3.ge4d4c93
pkgrel=1
pkgdesc="Multithreaded PNG optimizer"
arch=('i686' 'x86_64')
url="https://github.com/shssoichiro/oxipng"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=('oxipng')
conflicts=('oxipng')
source=("git+https://github.com/shssoichiro/oxipng.git")
sha256sums=('SKIP')


pkgver() {
  cd "oxipng"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "oxipng"

  #cargo test \
  #  --locked \
  #  --release
}

package() {
  cd "oxipng"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/oxipng"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/oxipng"
}
