# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-bin
pkgver=4.1.0
pkgrel=1
pkgdesc="An interactive theorem prover"
arch=('x86_64' 'aarch64')
url="https://leanprover.github.io/"
license=('Apache')
optdepends=('bash')
provides=("lean4=$pkgver")
conflicts=('lean4')
options=('staticlibs')
source_x86_64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux.tar.zst")
source_aarch64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux_aarch64.tar.zst")
sha256sums_x86_64=('51bb8aca400d480ecf9088d8bd15a9c3f0eb3016064f9adc726fec8156b845ce')
sha256sums_aarch64=('944f21b5280be9b9b9f1e881cdb437e3d097b0c99c7b25fc5f9097a5737ea051')


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
