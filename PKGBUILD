# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=agate-git
pkgver=2.4.1.r16.g8fd9ca1
pkgrel=1
pkgdesc="Very simple server for the Gemini hypertext protocol"
arch=('i686' 'x86_64')
url="https://github.com/mbrubeck/agate"
license=('apache' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=('agate')
conflicts=('agate')
options=('staticlibs')
source=("git+https://github.com/mbrubeck/agate.git")
sha256sums=('SKIP')


pkgver() {
  cd "agate"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "agate"

  cargo test \
    --release \
    --locked
}

package() {
  cd "agate"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/agate"
  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/agate"
}
