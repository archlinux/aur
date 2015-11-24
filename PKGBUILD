# Maintainer: Mansour Behabadi <mansour@oxplot.com>

pkgname=upmpdcli
pkgver=0.12.0
pkgrel=1
pkgdesc="A UPnP Media Renderer front-end for the Music Player Daemon (MPD)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.lesbonscomptes.com/upmpdcli/"
license=('GPL2')
depends=('libmpdclient' 'libupnpp>=0.12.1')
install=upmpdcli.install
source=(http://www.lesbonscomptes.com/upmpdcli/downloads/$pkgname-$pkgver.tar.gz)
sha256sums=('7862fc599fc60dfdf22bbbf7e134655d29c51a8ccc6b5cc81232f7bc4a7351c9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --sysconfdir=/etc --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 systemd/upmpdcli.service ${pkgdir}/usr/lib/systemd/system/upmpcli.service
  sed '/\[Service\]/a User=upmpdcli' -i ${pkgdir}/usr/lib/systemd/system/upmpcli.service
}
