# Contributor: snakeroot <cwa AT pipeline DOT com>
# Maintainer: snakeroot <cwa AT pipeline DOT com>
pkgname='slimpris2'
pkgver=3.1.2
pkgrel=1
pkgdesc='MPRIS remote control of Lyrion Music Server (Logitech Media Server/Slimserver)'
arch=('any')
url='https://github.com/mavit/slimpris2'
license=('GPL3')
makedepends=('intltool' 'pandoc' 'systemd')
depends=('libsoup' 'python>=3.6' 'python-dbus' 'python-gobject' 'python-pyxdg' 'python-simplejson' 'python-six')
source=(slimpris2-${pkgver}.tar.gz::"https://github.com/mavit/slimpris2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('62557934a0a2e5762fb4e406621940a7f9d832cf1a1c9a0e1670a7014a773236')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/lib/systemd/user-preset/80-slimpris2.preset
}
