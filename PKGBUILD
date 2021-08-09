# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rtrtr-git
pkgver=0.1.2.r14.g921276b
pkgrel=1
pkgdesc="An RPKI data proxy"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/projects/rpki/rtrtr/"
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=('rtrtr')
conflicts=('rtrtr')
source=("git+https://github.com/NLnetLabs/rtrtr.git")
sha256sums=('SKIP')


pkgver() {
  cd "rtrtr"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "rtrtr"

  #cargo test \
  #  --locked \
  #  --release
}

package() {
  cd "rtrtr"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/rtrtr"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/rtrtr"
}
