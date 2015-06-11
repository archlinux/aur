# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmitime
pkgver=0.3
pkgrel=3
pkgdesc="A dock app showing standard time, date and Internet time"
url="http://www.cs.mun.ca/~gstarkes/wmaker/dockapps/time.html#wmitime"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxpm')
source=("http://www.cs.mun.ca/~gstarkes/wmaker/dockapps/files/wmitime-0.3.tar.gz")
md5sums=('7168e9d6b5930d510727530a309d812c')

_name=wmITime
_genericname=Clock
_categories="DockApp;WMAKER;"
_custom="StartupWMClass=wmitime"
_icon="GNUstep3D"

prepare() {
  cd "$srcdir/$pkgname/$pkgname"
  cat>$pkgname.desktop<<-PBEOF
	[Desktop Entry]
	Encoding=UTF-8
	Type=Application
	Name=$_name
	GenericName=$_genericname
	Comment=$pkgdesc
	Exec=$pkgname
	Icon=$_icon
	Terminal=false
	StartupNotify=false
	Categories=$_categories
	$_custom
	X-Arch-Package=$pkgname
PBEOF
}

build() {
  cd "$srcdir/$pkgname/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname/$pkgname"
  install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim: set sw=2 et:
