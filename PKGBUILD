# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean-bin
pkgver=4.36.0
pkgrel=1
pkgdesc="An interactive theorem prover"
arch=('aarch64' 'x86_64')
url="https://leanprover.github.io/"
license=('Apache-2.0')
optdepends=('bash')
provides=("lean=$pkgver")
conflicts=('lean')
options=('staticlibs')
source_aarch64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux_aarch64.tar.zst")
source_x86_64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux.tar.zst")
sha256sums_aarch64=('35471998152191ef809418ce5bf61f8fc5f209e5e3be05b48bdc4949fdb3e726')
sha256sums_x86_64=('2b7ab1ed8b92d2e6abfaf41344823b510064dbc9c0260cac73eb496ab2dea6eb')


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
