# Maintainer: Mansour Behabadi <mansour@oxplot.com>

pkgname=upmpdcli
pkgver=1.1.2
pkgrel=1
pkgdesc="A UPnP Media Renderer front-end for the Music Player Daemon (MPD)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.lesbonscomptes.com/upmpdcli/"
license=('GPL2')
depends=('libmpdclient' 'libupnpp>=0.14.1')
optdepends=('python2: OpenHome Radio Service')
install=upmpdcli.install
source=(http://www.lesbonscomptes.com/upmpdcli/downloads/$pkgname-$pkgver.tar.gz)
sha256sums=('4866a4a5c54f8e3355ca7337860b998e1c8c562a7d26c4d8ae72eefdf9279982')

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
