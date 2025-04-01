# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-bin
pkgver=4.18.0
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
sha256sums_i686=('219a45460027e7f49d4ee0d608a55568346ea3d5dd5a2d0f2850696def9ae4d2')
sha256sums_x86_64=('567725f83133b7449dbfc6eb87bbc31f1c4df8d035687d17f07e46ce78a27980')
sha256sums_aarch64=('75be1e8b909dc197341aa130a3c18789b3c4f84a2dd59357aca08cc7796ab469')


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
