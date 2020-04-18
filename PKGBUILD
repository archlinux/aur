# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=routinator-git
pkgver=0.6.4.r79.g804c74e
pkgrel=1
pkgdesc="RPKI validator written in Rust"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/rpki"
license=('BSD')
depends=('gcc-libs' 'rsync')
makedepends=('git' 'rust')
provides=('routinator')
conflicts=('routinator')
options=('staticlibs')
source=("git+https://github.com/NLnetLabs/routinator.git")
sha256sums=('SKIP')


pkgver() {
  cd "routinator"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


check() {
  cd "routinator"

  cargo test \
    --release
}

package() {
  cd "routinator"

  cargo install \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/routinator"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/routinator"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/routinator"
}
