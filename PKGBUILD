# Maintainer: Marcin Nowak <marcin [dot] j [dot] nowak (at) gmail [dot] com>

pkgname=mad-pascal
pkgver=1.6.9
pkgrel=4
pkgdesc="Mad-Pascal (MP) is a 32-bit Turbo Pascal compiler for Atari XE/XL"
arch=('x86_64')
url="https://github.com/tebe6502/Mad-Pascal"
source=(
    https://github.com/tebe6502/Mad-Pascal/archive/refs/tags/v$pkgver.tar.gz
    )

sha256sums=(
    'b966351bd6fb990704a8bdc5b895b4f1de9e83450d2cc734ca5e9d50e19f03f2'
    )
license=('unknown')
provides=('mad-pascal')
depends=('glibc')
makedepends=('fpc')

build() {
  cd "$srcdir/Mad-Pascal-$pkgver/src"
  fpc -Mdelphi -vh -O3 mp.pas
}

package() {
  cd "$srcdir/Mad-Pascal-$pkgver"

  install -dm755 "$pkgdir/opt/mad-pascal"
  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 src/mp "$pkgdir/opt/mad-pascal"
  ln -rs $pkgdir/opt/mad-pascal/mp $pkgdir/usr/bin/mp
  cp -r $srcdir/Mad-Pascal-$pkgver/base $pkgdir/opt/mad-pascal/
  cp -r $srcdir/Mad-Pascal-$pkgver/blibs $pkgdir/opt/mad-pascal/
  cp -r $srcdir/Mad-Pascal-$pkgver/dlibs $pkgdir/opt/mad-pascal/
  cp -r $srcdir/Mad-Pascal-$pkgver/lib $pkgdir/opt/mad-pascal/
  cp -r $srcdir/Mad-Pascal-$pkgver/logo $pkgdir/opt/mad-pascal/
  cp -r $srcdir/Mad-Pascal-$pkgver/madstrap $pkgdir/opt/mad-pascal/
  cp -r $srcdir/Mad-Pascal-$pkgver/samples $pkgdir/opt/mad-pascal/
  find $pkgdir/opt/mad-pascal -type d -exec chmod gou+x {} \;
  find $pkgdir/opt/mad-pascal -type f -exec chmod gou+r {} \;
  install -dm755 "$pkgdir/opt/mad-pascal/src/targets"
  install -m755 $srcdir/Mad-Pascal-$pkgver/src/targets/* "$pkgdir/opt/mad-pascal/src/targets"
}
