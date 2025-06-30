# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-bin
pkgver=4.21.0
pkgrel=1
pkgdesc="An interactive theorem prover"
arch=('aarch64' 'x86_64')
url="https://leanprover.github.io/"
license=('Apache-2.0')
optdepends=('bash')
provides=("lean4=$pkgver")
conflicts=('lean4')
options=('staticlibs')
source_x86_64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux.tar.zst")
source_aarch64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux_aarch64.tar.zst")
sha256sums_x86_64=('455c6df09d5bd54d2a51b137939c47e2dda816d512ac789c4b3642c9bf98bde8')
sha256sums_aarch64=('3432ea6b1333aa58ea0f6493fcfc5e88f6a8e132458e143dfe9012b5c42f0301')


package() {
  if [ "$CARCH" = "x86_64" ]; then
    cd "lean-$pkgver-linux"
  else
    cd "lean-$pkgver-linux_$CARCH"
  fi

  install -dm755 "$pkgdir/opt/lean4"
  mv * "$pkgdir/opt/lean4"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/lean4/bin"/{lake,lean,leanc,leanmake} "$pkgdir/usr/bin"

  install -Dm644 "$pkgdir/opt/lean4/LICENSES" -t "$pkgdir/usr/share/licenses/lean4"
}
