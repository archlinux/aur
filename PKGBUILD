# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-bin
pkgver=4.11.0
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
sha256sums_i686=('23b15d83ec11103b157ea67eebd19fd6dc4fc107cfdc2e90ca3ede814cdc9c46')
sha256sums_x86_64=('8cdeb4a8fd15b4aa9cb3c00dfa48d42c6035900ab5d992790e443243e3ca05db')
sha256sums_aarch64=('6dd349b700f36279025e469a4f5df7e62a79e1f4879b622f8ca02fbc91c340dc')


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
