# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean-bin
pkgver=4.35.0
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
sha256sums_aarch64=('c0c6f34f35ba1dcc5c4a5fd106fefab9eb5e8469712624dd2c868d51b63177c2')
sha256sums_x86_64=('7289597a44543246c9227b8cae501767e095ce17f6d448b95fc4a8dc97268f6d')


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
