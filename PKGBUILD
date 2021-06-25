# Maintainer: amiga23 <t.scheller@email.de>
# Contributor: duxet <duxetlg@gmail.com>
pkgname=k3s-1.20-bin
pkgver=1.20.8+k3s1
pkgrel=1
pkgdesc="Lightweight Kubernetes"
url="https://k3s.io"
license=('Apache')
arch=('x86_64' 'armv7h' 'aarch64')
conflicts=('k3s-git' 'k3s-bin' 'k3s-1.17-bin' 'k3s-1.18-bin' 'k3s-1.19-bin' 'k3s-1.21-bin')

backup=("etc/systemd/system/k3s.service.env")

source=(
  "k3s.service"
  "k3s.service.env"
  "k3s-killall.sh"
)

source_x86_64=(
  "k3s-${pkgver}-x86_64::https://github.com/rancher/k3s/releases/download/v${pkgver}/k3s"
)

source_armv7h=(
  "k3s-${pkgver}-armv7h::https://github.com/rancher/k3s/releases/download/v${pkgver}/k3s-armhf"
)

source_aarch64=(
  "k3s-${pkgver}-aarch64::https://github.com/rancher/k3s/releases/download/v${pkgver}/k3s-arm64"
)
sha256sums=('f4ae496b69b3dd376a28298df50297728a47761b041be522adf2537aa8a8c3d8'
            '667199fa6b811dde3aef3e626e2695a566ad64c9a03d19d0c94a1f104a7612d0'
            'a09747c9541cd22df97adcabc44c09d97a4305a9d976e9bf8191849cb1ce30b6')
sha256sums_x86_64=('07acd68c89c42ea5c15eca16b857d40fb5c13d4a943d550e780da3ebaa9561c2')
sha256sums_armv7h=('cc83ac7f3b2cab62f5a32df621bc722f1e3f5911893568547ad568c2dc0cd631')
sha256sums_aarch64=('322369d7c2c49ee67fc9ba83d273c90bc0b494842e1392cd16063b8320e7aa83')


package() {
  install -Dm 755 $srcdir/k3s-${pkgver}-${CARCH} $pkgdir/usr/bin/k3s

  install -dm 755 $pkgdir/usr/lib/systemd/system
  install -dm 755 $pkgdir/etc/systemd/system

  install -m 644 $srcdir/k3s.service $pkgdir/usr/lib/systemd/system/k3s.service
  install -m 400 $srcdir/k3s.service.env $pkgdir/etc/systemd/system/k3s.service.env

  install -m 700 $srcdir/k3s-killall.sh $pkgdir/usr/bin/k3s-killall.sh
}
