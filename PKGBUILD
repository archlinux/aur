# Maintainer: amiga23 <t.scheller@email.de>
# Contributor: FabioLolix <fabio.loli@disroot.org>
# Contributor: duxet <duxetlg@gmail.com>
pkgname=k3s-1.31-bin
pkgver=1.31.13+k3s1
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
sha256sums_x86_64=('0fadce496d8007eeb55a16390bd12257d423026316c6860f336ea528e05f3886')
sha256sums_armv7h=('b74e58c4db17d17acb3fdbfa36f351a7056a0717ca039e535cac570a8d5f2d8a')
sha256sums_aarch64=('1884b7d29e25d8544ba0ad8f885caee38c2e702b93e70129b959af65d5639471')



package() {
  install -Dm 755 $srcdir/k3s-${pkgver}-${CARCH} $pkgdir/usr/bin/k3s

  install -dm 755 $pkgdir/usr/lib/systemd/system

  install -m 644 $srcdir/k3s.service $pkgdir/usr/lib/systemd/system/k3s.service
  install -Dm 400 $srcdir/k3s.env $pkgdir/etc/conf.d/k3s

  install -m 700 $srcdir/k3s-killall.sh $pkgdir/usr/bin/k3s-killall
}
