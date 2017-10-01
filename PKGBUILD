# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='lxc-snapshots'
pkgver=1.12
pkgrel=1
pkgdesc='Run pi-hole or openvpn in lxc snapshot containers via systemd'
arch=('any')
url='https://github.com/graysky2/lxc-snapshots'
license=('MIT')
depends=('systemd' 'lxc>=1:2.1.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
backup=('etc/conf.d/openvpn-lxc-snapshot.conf' 'etc/conf.d/pihole-lxc-snapshot.conf')
sha256sums=('0ca896a7b36f48ba7864b80f2b9c150a4668df63cdc989a216ea248a300ae617')
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
