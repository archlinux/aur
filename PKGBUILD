# Contributor: fredbezies <fredbezies@gmail.com>
# Maintainer: Lari Tikkanen <lartza@wippies.com>

pkgname=transmission-svn-gtk
_pkgname=transmission
pkgver=14103
pkgrel=1
pkgdesc="Fast, easy, and free BitTorrent client (GTK+ GUI)(Git version)"
arch=('i686' 'x86_64')
url="http://www.transmissionbt.com/"
license=('MIT')
depends=('curl' 'libevent' 'gtk3' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'subversion')
optdepends=('notification-daemon: Desktop notification support'
  	    'transmission-cli: daemon and web support')
provides=(transmission-gtk)
conflicts=(transmission-gtk)
install=transmission-svn-gtk.install
source=("${_pkgname}::svn://svn.transmissionbt.com/Transmission/trunk")
sha1sums=('SKIP')

pkgver() {
  cd $_pkgname
  svnversion | tr -d [A-z]
}

build() {
  cd $srcdir/$_pkgname
  ./autogen.sh --prefix=/usr --disable-cli --disable-daemon
  make
}

package() {
  cd $srcdir/$_pkgname
  make -C gtk DESTDIR="$pkgdir" install
  make -C po DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
