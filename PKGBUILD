# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
# Maintainer: Mansour Behabadi <mansour@oxplot.com>
# Maintainer: Tilman Vatteroth <tilman.vatteroth@udo.edu>

pkgname=upmpdcli
pkgver=1.4.1
pkgrel=2
pkgdesc="A UPnP Media Renderer front-end for the Music Player Daemon (MPD)"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="http://www.lesbonscomptes.com/upmpdcli/"
license=('GPL2')
depends=('libmpdclient' 'libupnpp>=0.17.0' 'libmicrohttpd' 'jsoncpp' 'curl' 'expat' 'python-requests' 'recoll' 'python-bottle' 'python-mutagen' 'mutagen' 'aspell-en' 'id3lib' 'python-waitress' 'sqlite3' 'chmlib')
install=upmpdcli.install
source=(http://www.lesbonscomptes.com/upmpdcli/downloads/$pkgname-$pkgver.tar.gz)
sha256sums=('SKIP')
backup=('etc/upmpdcli.conf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --sysconfdir=/etc --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 systemd/upmpdcli.service ${pkgdir}/usr/lib/systemd/system/upmpdcli.service
  sed '/\[Service\]/a User=upmpdcli' -i ${pkgdir}/usr/lib/systemd/system/upmpdcli.service
  chmod 644 ${pkgdir}/etc/upmpdcli.conf
}
