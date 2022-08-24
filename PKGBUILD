# Contributor: snakeroot <cwa AT pipeline DOT com>
# Maintainer: snakeroot <cwa AT pipeline DOT com>
pkgname='slimpris2'
pkgver=3.0.1
pkgrel=1
pkgdesc='MPRIS remote control of Logitech Media Server (Slimserver)'
arch=('any')
url='https://github.com/mavit/slimpris2'
license=('GPL3')
makedepends=('intltool' 'pandoc' 'perl>=5.8.1' 'systemd')
depends=('python>=3.6' 'dbus-python' 'python-gobject' 'python-pyxdg' 'python-simplejson' 'python-six')
source=(slimpris2-${pkgver}.tar.gz::"https://github.com/mavit/slimpris2/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('5d893e2540660ab281b5784c33e12532')

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
