# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Giovanni Scafora <linuxmania@gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-recordmydesktop
pkgver=0.3.8
pkgrel=9
pkgdesc="A pygtk frontend for recordmydesktop"
arch=('any')
url="http://recordmydesktop.sourceforge.net"
license=('GPL')
depends=('pygtk>=2.10' 'recordmydesktop>=0.3.8.1' 'xorg-xwininfo' 'python2')
source=(https://downloads.sourceforge.net/sourceforge/recordmydesktop/${pkgname}-${pkgver}.tar.gz)
sha256sums=('61ad43a6e4f0bf86d8553f03297e4b1b137b47337fa150ce1da8c24494ca8326')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  sed -i 's#/usr/bin/python#/usr/bin/python2#' $pkgdir/usr/bin/gtk-recordMyDesktop
}
