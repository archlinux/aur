# Maintainer: amiga23 <t.scheller@email.de>
# Contributor: FabioLolix <fabio.loli@disroot.org>
# Contributor: duxet <duxetlg@gmail.com>
pkgname=k3s-1.29-bin
pkgver=1.29.4+k3s1
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
sha256sums=('c24735658b766d4e270380181e3ecd537a8e9dce9cb96673f39170b6798ed659'
            'cde96553e9609791cd9fe1ff33482e33c4cfec22761f7766f5c278a9ce2ec679'
            'a09747c9541cd22df97adcabc44c09d97a4305a9d976e9bf8191849cb1ce30b6')
sha256sums_x86_64=('2bcc3f7ba201e219575c6b7c3663af409e6dde691903b9d049302134816cf0e6')
sha256sums_armv7h=('d6321a8d06c0c79be51c672ba676cdad1e66ce07280f0ea5fd50662bc0a3d7f9')
sha256sums_aarch64=('bc5ac0dabe47d865717045ba1a63fd55da791f5c74b6dee8406328fb9a23bb61')


package() {
  install -Dm 755 $srcdir/k3s-${pkgver}-${CARCH} $pkgdir/usr/bin/k3s

  install -dm 755 $pkgdir/usr/lib/systemd/system
  install -dm 755 $pkgdir/etc/systemd/system

  install -m 644 $srcdir/k3s.service $pkgdir/usr/lib/systemd/system/k3s.service
  install -Dm 400 $srcdir/k3s.env $pkgdir/etc/conf.d/k3s

  install -m 700 $srcdir/k3s-killall.sh $pkgdir/usr/bin/k3s-killall
}
