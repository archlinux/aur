# Maintainer: Swift Geek

pkgname=qrigol-git
_pkgname=${pkgname%-*}
pkgver=a
pkgrel=1
pkgdesc="Qt assistant for Rigol DS1000 series scopes"
arch=('i686' 'x86_64')
url="http://www.eevblog.com/forum/testgear/free-ds1052eds1102e-software-for-linux/msg684186/"
license=('GPL2')
makedepends=('git' 'qt5-webkit')
source=("git://github.com/wd5gnr/qrigol.git" '40-rigol.rules')
md5sums=('SKIP'
         '45bf05e7568c4f0c359282e4199654a9')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD # Fix to better comply with github display
}

build() {
  cd "$srcdir/${_pkgname}"
  qmake
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  install -d "$pkgdir/usr/bin"
  install -m 755 "$srcdir/${_pkgname}/qrigol" "$pkgdir/usr/bin/qrigol"
# Udev rules
  install -d "$pkgdir/usr/lib/udev/rules.d/"
  install -m 644 "$srcdir/40-rigol.rules" "${pkgdir}/usr/lib/udev/rules.d/"
# Desktop file
  install -d "$pkgdir/usr/share/applications"
  install -m 644 "$srcdir/${_pkgname}/qrigol.desktop" $pkgdir/usr/share/applications/
# Desktop icon
  install -d "$pkgdir/usr/share/icons/"
  install -m 644 "$srcdir/${_pkgname}/icons/main.png" $pkgdir/usr/share/icons/qrigol.png
}
