# Maintainer: Swift Geek

pkgname=qrigol-git
_pkgname=${pkgname%-*}
pkgver=a
pkgrel=1
pkgdesc="Qt assistant for Rigol DS1000 series scopes"
arch=('any')
url="http://www.eevblog.com/forum/testgear/free-ds1052eds1102e-software-for-linux/msg684186/"
license=('GPL2')
makedepends=('git' 'qt5-webkit')
source=("git://github.com/wd5gnr/qrigol.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD # Fix to better comply with github display
}

build() {
  cd "$srcdir/${_pkgname}"
  sed -i -e '1iQT += webkitwidgets\' qrigol.pro
  qmake
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  install -d "$pkgdir/usr/bin"
  install -m 755 "$srcdir/${_pkgname}/qrigol" "$pkgdir/usr/bin/qrigol"
}
