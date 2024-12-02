# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-bin
pkgver=4.14.0
pkgrel=1
pkgdesc="An interactive theorem prover"
arch=('i686' 'x86_64' 'aarch64')
url="https://leanprover.github.io/"
license=('Apache-2.0')
optdepends=('bash')
provides=("lean4=$pkgver")
conflicts=('lean4')
options=('staticlibs')
source_i686=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux_x86.tar.zst")
source_x86_64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux.tar.zst")
source_aarch64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux_aarch64.tar.zst")
sha256sums_i686=('8efbf9ee75d6d4142d9967ae0bee83eec40e30f0303dfdb6829b8f688e519476')
sha256sums_x86_64=('320f18e7d58271d95fced740522b5a5ed41b85b2af5bf0e8ab9a8dbc380e450a')
sha256sums_aarch64=('6ce956ce2d2b9b504075bbb10e30ca1d776b0bb8b3d2b67b3c28f666ea124ae2')


package() {
  if [ "$CARCH" = "x86_64" ]; then
    cd "lean-$pkgver-linux"
  elif [ "$CARCH" = "i686" ]; then
    cd "lean-$pkgver-linux_x86"
  else
    cd "lean-$pkgver-linux_$CARCH"
  fi

  install -dm755 "$pkgdir/opt/lean4"
  mv * "$pkgdir/opt/lean4"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/lean4/bin"/{lake,lean,leanc,leanmake} "$pkgdir/usr/bin"

  install -Dm644 "$pkgdir/opt/lean4/LICENSES" -t "$pkgdir/usr/share/licenses/lean4"
}
