# Maintainer: Mansour Behabadi <mansour@oxplot.com>
# Maintainer: Tilman Vatteroth <tilman.vatteroth@udo.edu>

pkgname=upmpdcli
pkgver=1.2.10
pkgrel=0
pkgdesc="A UPnP Media Renderer front-end for the Music Player Daemon (MPD)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.lesbonscomptes.com/upmpdcli/"
license=('GPL2')
depends=('libmpdclient' 'libupnpp>=0.15.1' 'libmicrohttpd' 'jsoncpp' 'curl' 'expat')
optdepends=('python2: OpenHome Radio Service')
install=upmpdcli.install
source=(http://www.lesbonscomptes.com/upmpdcli/downloads/$pkgname-$pkgver.tar.gz)
sha256sums=('a925dac1721fe002c16ed3c9e2de0370c2fe6c1e6f4f97a7551f20c6226cc0e2')

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
