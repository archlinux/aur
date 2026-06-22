# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-findutils-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Rust implementation of findutils"
arch=('x86_64')
url="https://github.com/uutils/findutils"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("uutils-findutils=$pkgver")
conflicts=('uutils-findutils')
source_x86_64=("https://github.com/uutils/findutils/releases/download/$pkgver/findutils-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('beb3c82b785cb1c9e86d1f4e73ad836955dfee692e5605bdbdc23c16745c4c24')


package() {
  install -Dm755 "$srcdir/findutils-$CARCH-unknown-linux-gnu"/{find,xargs} -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/findutils-$CARCH-unknown-linux-gnu/LICENSE" -t "$pkgdir/usr/share/licenses/uutils-findutils"

  for path in "$pkgdir/usr/bin"/*; do
    dir=$(dirname "$path")
    basename=$(basename "$path")
    mv "$dir/$basename" "$dir/uu-$basename"
  done
}
