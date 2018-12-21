# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=lxc-service-snapshots
pkgver=2.12
pkgrel=1
pkgdesc='Run disposable (read-only then delete) Linux containers (LXC) to serve up OpenVPN, Pi-Hole, or WireGuard.'
arch=('any')
url='https://github.com/graysky2/lxc-service-snapshots'
license=('MIT')
depends=('systemd' 'lxc>=1:2.1.0')
optdepends=('fake-hwclock-git: save/restore system clock on machines without working RTC hardware')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
backup=('etc/conf.d/openvpn-lss.conf' 'etc/conf.d/pihole-lss.conf' 'etc/conf.d/wireguard-lss.conf')
sha256sums=('6882734f8f5e00df6b25bbe3807dc43f5b6f491521792a00a5ea2e02e120081c')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
