# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean-bin
pkgver=4.34.1
pkgrel=1
pkgdesc="An interactive theorem prover"
arch=('aarch64' 'x86_64')
url="https://leanprover.github.io/"
license=('Apache-2.0')
optdepends=('bash')
provides=("lean=$pkgver")
conflicts=('lean')
options=('staticlibs')
source_x86_64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux.tar.zst")
source_aarch64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux_aarch64.tar.zst")
sha256sums_aarch64=('fdb974c2cdb4627e090d5d4007b913e09d13c4868720fb5594e22808b3de9e37')
sha256sums_x86_64=('47bf4bbd78f70c2e9670598ab7124d92b6efb7330ff33e5fbb4030f6fd72e4e4')


package() {
  if [ "$CARCH" = "x86_64" ]; then
    cd "lean-$pkgver-linux"
  else
    cd "lean-$pkgver-linux_$CARCH"
  fi

  install -dm755 "$pkgdir/opt/lean"
  mv ./* "$pkgdir/opt/lean"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/lean/bin"/{lake,lean,leanc,leanchecker,leanir,leanmake,leantar} "$pkgdir/usr/bin"

  install -Dm644 "$pkgdir/opt/lean/LICENSES" -t "$pkgdir/usr/share/licenses/lean"
}
