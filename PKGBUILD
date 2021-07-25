# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=piping-server-git
pkgver=0.8.5.r1.gf7d40ed
pkgrel=1
pkgdesc="Infinitely transfer between any device over pure HTTP"
arch=('i686' 'x86_64')
url="https://github.com/nwtgck/piping-server-rust"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=('piping-server')
conflicts=('piping-server')
source=("git+https://github.com/nwtgck/piping-server-rust.git")
sha256sums=('SKIP')


pkgver() {
  cd "piping-server-rust"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "piping-server-rust"

  cargo test \
    --release \
    --locked
}

package() {
  cd "piping-server-rust"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/piping-server-rust"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/piping-server"
}
