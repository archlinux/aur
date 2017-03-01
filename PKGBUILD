# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

_pkgname=orage
pkgname=$_pkgname-4.10
pkgver=4.10.0
pkgrel=1
pkgdesc="A simple calendar application with reminders for Xfce"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org/projects/"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libical' 'popt' 'libnotify')
makedepends=('intltool')
conflicts=('xfcalendar' 'orage')
provides=('orage')
replaces=('xfcalendar' 'orage')
source=(http://archive.xfce.org/src/apps/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2)
sha256sums=('6cb854f3437e31bab23abfce97bd10afa1636a9a1480d80e14e26c85d06be7c0')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --enable-libical \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
