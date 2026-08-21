# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean-bin
pkgver=4.33.1
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
sha256sums_aarch64=('f7353a8b2a8741c84558523e450556f9a1c45e3cafcf54399ce68c6a24c55f07')
sha256sums_x86_64=('890afd185370f85666025b883914ab4f4b339136f8c96167b69cfb62aecaf235')


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
