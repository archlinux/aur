# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-bin
pkgver=4.6.1
pkgrel=1
pkgdesc="An interactive theorem prover"
arch=('i686' 'x86_64' 'aarch64')
url="https://leanprover.github.io/"
license=('LicenseRef-')
optdepends=('bash')
provides=("lean4=$pkgver")
conflicts=('lean4')
options=('staticlibs')
source_i686=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux_x86.tar.zst")
source_x86_64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux.tar.zst")
source_aarch64=("https://github.com/leanprover/lean4/releases/download/v$pkgver/lean-$pkgver-linux_aarch64.tar.zst")
sha256sums_i686=('1310cd973a0d9cddea3e6425cf65635f6098b44a03bd39094ea2477406afd5f6')
sha256sums_x86_64=('69a1be15fbd689cb716606ba9f24f361263497500b149745cad7a55d9e7dbafc')
sha256sums_aarch64=('ed5add9b2bb1924efa5422647bf614e797875a92268ee54f3c13bb5d5c187d68')


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
