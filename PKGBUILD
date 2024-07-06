# Contributor: snakeroot <cwa AT pipeline DOT com>
# Maintainer: snakeroot <cwa AT pipeline DOT com>
pkgname='slimpris2'
pkgver=3.0.4
pkgrel=2
pkgdesc='MPRIS remote control of Lyrion Music Server (Logitech Media Server/Slimserver)'
arch=('any')
url='https://github.com/mavit/slimpris2'
license=('GPL3')
makedepends=('intltool' 'pandoc' 'systemd')
depends=('python>=3.6' 'python-dbus' 'python-gobject' 'python-pyxdg' 'python-simplejson' 'python-six')
source=(slimpris2-${pkgver}.tar.gz::"https://github.com/mavit/slimpris2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b7a6f1ca66e6a8f47a39cd6561c9140122165bc33a0aed63824a124a5c3c0a28')

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
