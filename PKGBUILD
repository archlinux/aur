# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=lxc-service-snapshots
pkgver=2.00
pkgrel=1
pkgdesc='Run disposable (read-only then delete) Linux containers (LXC) to serve up OpenVPN, Pi-Hole, or WireGuard.'
arch=('any')
url='https://github.com/graysky2/lxc-service-snapshots'
license=('MIT')
depends=('systemd' 'lxc>=1:2.1.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
backup=('etc/conf.d/openvpn-lss.conf' 'etc/conf.d/pihole-lss.conf' 'etc/conf.d/wireguard-lss.conf')
sha256sums=('87348bd7433ef7221bf325cf6ee7d5e12cc5ac394a6fe1af1b25e1472ca155db')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
