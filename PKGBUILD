# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-bin
pkgver=4.25.1
pkgrel=2
pkgdesc="An interactive theorem prover"
arch=('aarch64' 'x86_64')
url="https://leanprover.github.io/"
license=('Apache-2.0')
optdepends=('bash')
provides=("lean4=$pkgver")
conflicts=('lean4')
options=('staticlibs')
source_x86_64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-4.25.0-linux.tar.zst")
source_aarch64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-4.25.0-linux_aarch64.tar.zst")
sha256sums_aarch64=('5beb4a1c6d2407e29c4141e0c791c5ab99c6c240e66f13c43aa86eb30790ea70')
sha256sums_x86_64=('a33d61f2aec9b8fce33ad37389417b5f9f4e757fde69d9396ecdf16193651a6a')


package() {
  if [ "$CARCH" = "x86_64" ]; then
    cd "lean-4.25.0-linux"
  else
    cd "lean-4.25.0-linux_$CARCH"
  fi

  install -dm755 "$pkgdir/opt/lean4"
  mv ./* "$pkgdir/opt/lean4"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/lean4/bin"/{lake,lean,leanc,leanmake} "$pkgdir/usr/bin"

  install -Dm644 "$pkgdir/opt/lean4/LICENSES" -t "$pkgdir/usr/share/licenses/lean4"
}
