# Maintainer: Lukas Winkler <derwinlu+aur AT gmail D0T com>
# Modified from quickfort package by Chee Sing Lee <cheesinglee@gmail.com>

_pkgname=quickfort
pkgname=${_pkgname}-git
pkgver=264
pkgrel=2
pkgdesc="A Dwarf Fortress utility for building forts from blueprint .CSV files. Git Version."
arch=(any)
url="http://github.com/joelpt/${_pkgname}.git"
license=('custom')
depends=('python2' 'python2-numpy')
makedepends=('git' 'sed')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/joelpt/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
  cd "$srcdir/$_pkgname"
  sed -i 's/\/bin\/python/\/bin\/python2/' qfconvert/qfconvert.py
  sed -i 's/.$//' qfconvert/qfconvert.py
  chmod +x qfconvert/qfconvert.py 
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir --parents $pkgdir/usr/share/quickfort/
  cp -r qfconvert/* $pkgdir/usr/share/quickfort/
  rm $pkgdir/usr/share/quickfort/*.bat
  mkdir --parents $pkgdir/usr/bin/
  touch $pkgdir/usr/bin/qfconvert
  echo "#!/bin/bash" >> $pkgdir/usr/bin/qfconvert
  echo '/usr/share/quickfort/qfconvert.py "$@"' >> $pkgdir/usr/bin/qfconvert
  chmod +x $pkgdir/usr/bin/qfconvert
}

# vim:set ts=2 sw=2 et:
