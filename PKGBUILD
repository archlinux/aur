# Contributor: Juan Diego Tascon
# Maintainer : Marcos Heredia <chelqo@gmail.com>

_pkgname=tzclock
pkgname=${_pkgname}-gtk2
pkgver=2.8.1
pkgrel=1
pkgdesc="Cairo clock to display the time around the world"
arch=('i686' 'x86_64')
url="http://tzclock.org/"
license="GPL"
depends=('libgnomeui')
conflicts=("${_pkgname}-gtk3" "${_pkgname}")
source=("http://tzclock.org/releases/GTK2/${_pkgname}-$pkgver.tar.bz2")
md5sums=('28657d101d2c2a4df619e959d7d78196')

build() {
  cd $srcdir/${_pkgname}-$pkgver/
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd $srcdir/${_pkgname}-$pkgver/
  make DESTDIR=${pkgdir} install || return 1

  install -dm755 $pkgdir/usr/share/licenses/$pkgname/
  install -Dpm644 COPYING $pkgdir/usr/share/licenses/$pkgname/

  install -dm755 $pkgdir/usr/share/doc/$pkgname/
  install -Dpm644 AUTHORS INSTALL tzclock.spec debian/control $pkgdir/usr/share/doc/$pkgname/

  echo "Comment[es]=Mostrar la hora alrededor del mundo" >>$pkgdir/usr/share/applications/TzClock.desktop
}
