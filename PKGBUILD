# Maintainer: Łaurent ʘ❢Ŧ Ŧough <laurent dot fough at gmail dot com>

pkgname=blueproximity-py3-git
_pkgname=blueproximity
pkgver=1.3.3
pkgrel=2
pkgdesc="A proximity detector for your mobile phone via bluetooth. (Python3 version)"
arch=('i686' 'x86_64')
url="https://github.com/tiktaalik-dev/blueproximity"
license=('GPL')
conflicts=('blueproximity')
depends=('python' 'bluez-utils-compat' 'python-gobject' 'python-configobj' 'python-pybluez' 'python-xapp' 'xapps' 'librsvg')
optdepends=('gnome-screensaver' 'xscreensaver')
source=(https://github.com/tiktaalik-dev/blueproximity/archive/v$pkgver.tar.gz)
options=(emptydirs)
md5sums=('223bccc87ea03298b3310d211c842574')

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/$_pkgname
  mkdir -p $pkgdir/usr/share/pixmaps

  install -D -m755 $srcdir/$_pkgname-$pkgver/proximity.py $pkgdir/usr/bin/
  install -D -m755 $srcdir/$_pkgname-$pkgver/start_proximity.sh $pkgdir/usr/bin/
  install -D -m755 $srcdir/$_pkgname-$pkgver/addons/blueproximity $pkgdir/usr/bin/
  install -D -m644 $srcdir/$_pkgname-$pkgver/addons/blueproximity.desktop $pkgdir/usr/share/applications/
  install -D -m644 $srcdir/$_pkgname-$pkgver/addons/blueproximity.xpm $pkgdir/usr/share/pixmaps/
  cp -r $srcdir/$_pkgname-$pkgver/* $pkgdir/usr/share/$_pkgname/
  chmod -R 644 $pkgdir/usr/share/$_pkgname/*

  sed -i -e "s|dist_path = './'|dist_path = '/usr/share/blueproximity/'|g" $pkgdir/usr/bin/proximity.py
  sed -i -e "s|dist_path = './'|dist_path = '/usr/share/blueproximity/'|g" $pkgdir/usr/share/$_pkgname/proximity.py
}