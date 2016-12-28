# Maintainer: Mansour Behabadi <mansour@oxplot.com>
# Maintainer: Tilman Vatteroth <tilman.vatteroth@udo.edu>

pkgname=upmpdcli
pkgver=1.2.11
pkgrel=0
pkgdesc="A UPnP Media Renderer front-end for the Music Player Daemon (MPD)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.lesbonscomptes.com/upmpdcli/"
license=('GPL2')
depends=('libmpdclient' 'libupnpp>=0.15.1' 'libmicrohttpd' 'jsoncpp' 'curl' 'expat')
optdepends=('python2: OpenHome Radio Service')
install=upmpdcli.install
source=(http://www.lesbonscomptes.com/upmpdcli/downloads/$pkgname-$pkgver.tar.gz)
sha256sums=('b3a2059c78315ac998476cd36a35179e161e8b84433ba9ab9f20d3fb2bb95e78')

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
