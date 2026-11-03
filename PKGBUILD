# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-findutils-bin
pkgver=0.11.0
pkgrel=3
pkgdesc="Rust implementation of findutils"
arch=('aarch64' 'x86_64')
url="https://github.com/uutils/findutils"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("uutils-findutils=$pkgver")
conflicts=('uutils-findutils')
source_aarch64=("$pkgname-$pkgver-aarch64.tar.xz::https://github.com/uutils/findutils/releases/download/$pkgver/findutils-aarch64-unknown-linux-musl.tar.xz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.xz::https://github.com/uutils/findutils/releases/download/$pkgver/findutils-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=('667554a89d7961ebfa46325bb68795e4107b1a3bc4552657ef51408ae056acea')
sha256sums_x86_64=('0b97b6084aa4fe9e3810ef7638dca72a04270f9568969a82cb04dfa5bc8145f5')


package() {
  _findutils=""
  case "$CARCH" in
    "aarch64")
      _findutils="findutils-$CARCH-unknown-linux-musl"
      ;;
    "x86_64")
      _findutils="findutils-$CARCH-unknown-linux-gnu"
      ;;
  esac

  install -Dm755 "$srcdir/$_findutils"/{find,locate,updatedb,xargs} -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/$_findutils/LICENSE" -t "$pkgdir/usr/share/licenses/uutils-findutils"

  for path in "$pkgdir/usr/bin"/*; do
    dir=$(dirname "$path")
    basename=$(basename "$path")
    mv "$dir/$basename" "$dir/uu-$basename"
  done
}
