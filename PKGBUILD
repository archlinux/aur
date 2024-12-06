# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-findutils-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Rust implementation of findutils"
arch=('x86_64')
url="https://github.com/uutils/findutils"
license=('MIT')
depends=('gcc-libs')
provides=("uutils-findutils=$pkgver")
conflicts=('uutils-findutils')
source_x86_64=("https://github.com/uutils/findutils/releases/download/$pkgver/findutils-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('be16aec9c6cbbc427f1884eae7ae6daeafd0e49aa496e126b3ca0a2e3f692fcf')


package() {
  install -Dm755 "$srcdir/findutils-$CARCH-unknown-linux-gnu"/{find,xargs} -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/findutils-$CARCH-unknown-linux-gnu/LICENSE" -t "$pkgdir/usr/share/licenses/uutils-findutils"

  for path in "$pkgdir/usr/bin"/*; do
    dir=$(dirname $path)
    basename=$(basename $path)
    mv "$dir/$basename" "$dir/uutils-$basename"
  done
}
