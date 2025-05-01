# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-bin
pkgver=4.19.0
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
sha256sums_i686=('5edd304a3313cc22f2c5085056dbdbdb39c46b4be69d475a7ad21dbe9d1c17b7')
sha256sums_x86_64=('6fe3ce97a58f44e2b3567d455b994eacec5bfe9ae7774f2a573444480ba813fe')
sha256sums_aarch64=('f19136d56bc3a5dc9af21edc88e64256c192d3f42c3e872dbeb30e392d7ad206')


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
