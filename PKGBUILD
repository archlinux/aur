# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='lxc-snapshots'
pkgver=1.15
pkgrel=1
pkgdesc='Run pi-hole or openvpn in lxc snapshot containers via systemd'
arch=('any')
url='https://github.com/graysky2/lxc-snapshots'
license=('MIT')
depends=('systemd' 'lxc>=1:2.1.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
backup=('etc/conf.d/openvpn-lxc-snapshot.conf' 'etc/conf.d/pihole-lxc-snapshot.conf')
sha256sums=('12f4a77c1b199e9ccca35626afdc5b0700b9365850657471e8e54d0f0b4857b1')
install=readme.install

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
