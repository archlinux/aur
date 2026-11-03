# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-findutils-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Rust implementation of findutils"
arch=('x86_64')
url="https://github.com/uutils/findutils"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("uutils-findutils=$pkgver")
conflicts=('uutils-findutils')
source_x86_64=("https://github.com/uutils/findutils/releases/download/$pkgver/findutils-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('0b97b6084aa4fe9e3810ef7638dca72a04270f9568969a82cb04dfa5bc8145f5')


package() {
  install -Dm755 "$srcdir/findutils-$CARCH-unknown-linux-gnu"/{find,xargs} -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/findutils-$CARCH-unknown-linux-gnu/LICENSE" -t "$pkgdir/usr/share/licenses/uutils-findutils"

  for path in "$pkgdir/usr/bin"/*; do
    dir=$(dirname "$path")
    basename=$(basename "$path")
    mv "$dir/$basename" "$dir/uu-$basename"
  done
}
