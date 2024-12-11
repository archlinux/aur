# Maintainer: envolution
# Contributor: Łaurent ʘ❢Ŧ Ŧough <laurent dot fough at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=blueproximity-py3-git
_pkgname=blueproximity
pkgver=1.3.3
pkgrel=2
pkgdesc="A proximity detector for your mobile phone via bluetooth. (Python3 version)"
arch=('i686' 'x86_64')
url="https://github.com/tiktaalik-dev/blueproximity"
license=('GPL')
conflicts=('blueproximity')
depends=('python' 'bluez-utils' 'bluez-deprecated-tools' 'python-gobject' 'python-configobj' 'python-pybluez' 'python-xapp' 'xapps' 'librsvg')
optdepends=('gnome-screensaver' 'xscreensaver')
source=("git+https://github.com/tiktaalik-dev/blueproximity.git" maintainer.patch)
md5sums=('SKIP'
         '62a7cd0539367a9f48a9d78ce0af8d72')

prepare() {
  cd $_pkgname
  cp proximity.py proximity.orig
  patch -Np2 -i ../maintainer.patch
}
package() {
  install -dm755 $pkgdir/usr/share/applications
  install -dm755 $pkgdir/usr/share/pixmaps
  install -dm755 $pkgdir/usr/share/$_pkgname
  install -dm755 $pkgdir/usr/bin
  install -Dm644 $_pkgname/addons/blueproximity.desktop $pkgdir/usr/share/applications/
  install -Dm644 $_pkgname/addons/blueproximity.xpm $pkgdir/usr/share/pixmaps/
  cp -r $_pkgname/* $pkgdir/usr/share/$_pkgname/

  ln -s /usr/share/blueproximity/proximity.py $pkgdir/usr/bin/proximity.py
  ln -s /usr/share/blueproximity/start_proximity.sh $pkgdir/usr/bin/start_proximity.sh
  ln -s /usr/share/blueproximity/addons/blueproximity $pkgdir/usr/bin/blueproximity

  #  sed -i 's|get_widget|get_object|g' $pkgdir/usr/share/blueproximity/proximity.py
  #  sed -i -e "s|dist_path = './'|dist_path = '/usr/share/blueproximity/'|g" $pkgdir/usr/share/$_pkgname/proximity.py
  #
}

# vim:set ts=2 sw=2 et:
