# Maintainer: amiga23 <t.scheller@email.de>
# Contributor: FabioLolix <fabio.loli@disroot.org>
# Contributor: duxet <duxetlg@gmail.com>
pkgname=k3s-1.33-bin
pkgver=1.33.2+k3s1
pkgrel=1
pkgdesc="Lightweight Kubernetes"
url="https://k3s.io"
license=('Apache')
arch=('x86_64' 'armv7h' 'aarch64')
provides=('k3s')
conflicts=('k3s')

backup=("etc/conf.d/k3s")

source=(
  "k3s.service"
  "k3s.env"
  "k3s-killall.sh"
)

source_x86_64=(
  "k3s-${pkgver}-x86_64::https://github.com/k3s-io/k3s/releases/download/v${pkgver}/k3s"
)

source_armv7h=(
  "k3s-${pkgver}-armv7h::https://github.com/k3s-io/k3s/releases/download/v${pkgver}/k3s-armhf"
)

source_aarch64=(
  "k3s-${pkgver}-aarch64::https://github.com/k3s-io/k3s/releases/download/v${pkgver}/k3s-arm64"
)
md5sums=('2c98ae8a95712a68f1f280fae7dc81cc'
         'c05e139fcdf93434640618c6237892b7'
         '958f9ca03f5ccfb71b52f90ca02cc2c8')
md5sums_x86_64=('a718dac81f23a64b8b7c795451950f71')
md5sums_armv7h=('c3c55f856a223be7e85477ffd813bcf1')
md5sums_aarch64=('c1fb2cf73badb6e27eb2135406aeb3ac')



package() {
  install -Dm 755 $srcdir/k3s-${pkgver}-${CARCH} $pkgdir/usr/bin/k3s

  install -dm 755 $pkgdir/usr/lib/systemd/system

  install -m 644 $srcdir/k3s.service $pkgdir/usr/lib/systemd/system/k3s.service
  install -Dm 400 $srcdir/k3s.env $pkgdir/etc/conf.d/k3s

  install -m 700 $srcdir/k3s-killall.sh $pkgdir/usr/bin/k3s-killall
}
