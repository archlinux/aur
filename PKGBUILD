# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Krzysztof Malinowski <boromil@gmail.com>

pkgname=alarm-clock
pkgver=1.4.3
pkgrel=2
pkgdesc="Alarm clock to schedule your tasks"
depends=('gtk2' 'gstreamer0.10' 'libunique' 'libnotify')
makedepends=('intltool')
arch=('i686' 'x86_64')
license=('GPL2')
source=('http://distro.ibiblio.org/slitaz/sources/packages-cooking/a/alarm-clock-1.4.3.tar.bz2')
options=('!libtool')
url="http://gnome-automate.net/"
md5sums=('e3100874935553c15b7d7d66d560bfc7')

package() {
  cd $srcdir/$pkgname-$pkgver

  sed 's/toolbutton1/Add Alarm/g' -i $srcdir/alarm-clock-${pkgver}/src/interface/alarm-clock.ui

  #patch for libnotify>=0.7
  sed 's/_with_status_icon(title, text, NULL, status_icon);/(title, text, NULL);/g' -i $srcdir/alarm-clock-${pkgver}/src/alarm_runner.c

  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install

}
