# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=lxc-service-snapshots
pkgver=2.14
pkgrel=1
pkgdesc='Run disposable (read-only then delete) Linux containers (LXC) to serve up OpenVPN, Pi-Hole, or WireGuard.'
arch=('any')
url='https://github.com/graysky2/lxc-service-snapshots'
license=('MIT')
depends=('systemd' 'lxc>=1:3.1.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
backup=('etc/conf.d/openvpn-lss.conf' 'etc/conf.d/pihole-lss.conf' 'etc/conf.d/wireguard-lss.conf')
sha256sums=('15b0bc7618eb2b98630fdd58d4218e5686b5bfcef9602ed05e67bdd1617d9f16')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
