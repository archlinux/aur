# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rtrtr-git
pkgver=0.2.2.r7.g2391ffb
pkgrel=1
pkgdesc="An RPKI data proxy"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/projects/rpki/rtrtr/"
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("rtrtr=$pkgver")
conflicts=('rtrtr')
source=("git+https://github.com/NLnetLabs/rtrtr.git")
sha256sums=('SKIP')


prepare() {
  cd "rtrtr"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "rtrtr"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "rtrtr"

  #cargo test \
  #  --frozen
}

package() {
  cd "rtrtr"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/rtrtr"
}
