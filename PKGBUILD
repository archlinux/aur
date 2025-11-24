# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-bin
pkgver=4.25.2
pkgrel=1
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
sha256sums_aarch64=('689babf14c92d14fe6ff0cc41ef60c1a1efd680cf80859493dd170e6be6952d8')
sha256sums_x86_64=('6c712e5cd68788ec1f26204cf640c8b121f724c774c5c41b3bf9e9effad1caea')


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
