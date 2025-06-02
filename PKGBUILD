# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-bin
pkgver=4.20.0
pkgrel=1
pkgdesc="An interactive theorem prover"
arch=('x86_64' 'aarch64')
url="https://leanprover.github.io/"
license=('Apache-2.0')
optdepends=('bash')
provides=("lean4=$pkgver")
conflicts=('lean4')
options=('staticlibs')
source_x86_64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux.tar.zst")
source_aarch64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux_aarch64.tar.zst")
sha256sums_x86_64=('f3b058430f87dd9569c7ebd269f0af1be7b010b754849b543ee6cf9ccc08d4f0')
sha256sums_aarch64=('222c585054070d3b26f5c818ff9b76d415b6a02c62034ba591dc780f127df28d')


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
