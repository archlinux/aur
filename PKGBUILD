# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean-bin
pkgver=4.34.0
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
sha256sums_aarch64=('40b04fdb7fb849d3c80e10c3bbeebc7b7354b6d3f07450b9168c2149b40d2a82')
sha256sums_x86_64=('caaa98356098c85dc0fcbbd28e1ec66f39eb6551829972b752ff20e1286b646b')


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
