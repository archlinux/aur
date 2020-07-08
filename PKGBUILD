# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=lxc-service-snapshots
pkgver=2.17
pkgrel=1
pkgdesc='Run disposable (read-only then delete) Linux containers (LXC) to serve up OpenVPN, Pi-Hole, or WireGuard.'
arch=(any)
url='https://github.com/graysky2/lxc-service-snapshots'
license=(MIT)
depends=(systemd 'lxc>=1:4.0.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
backup=(
   etc/conf.d/openvpn-lss.conf
   etc/conf.d/pihole-lss.conf
   etc/conf.d/wireguard-lss.conf
)
sha256sums=('8dc9aeb9f86b9cb490d04b0ae8e349a4108d2a3a7ebe8d032a677f9dd234da59')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
