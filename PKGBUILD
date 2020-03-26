# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=lxc-service-snapshots
pkgver=2.15
pkgrel=1
pkgdesc='Run disposable (read-only then delete) Linux containers (LXC) to serve up OpenVPN, Pi-Hole, or WireGuard.'
arch=('any')
url='https://github.com/graysky2/lxc-service-snapshots'
license=('MIT')
depends=('systemd' 'lxc>=1:4.0.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
backup=('etc/conf.d/openvpn-lss.conf' 'etc/conf.d/pihole-lss.conf' 'etc/conf.d/wireguard-lss.conf')
sha256sums=('a87348ea7fac690c85ea6f6e4ea33099d584b86cc09a091483d8d7ad6d62172b')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
