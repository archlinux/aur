# Maintainer: Mike Pento <mjpento@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=wmitime
pkgver=0.5
pkgrel=1
pkgdesc="A dock app showing standard time, date and Internet time"
url="https://www.dockapps.net/wmitime"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxpm')
options+=('!debug')
source=("https://www.dockapps.net/download/$pkgname-$pkgver.tar.gz")
md5sums=('9b9b6c2cce4e4a904f61e77e19ba14af')

_name=wmITime
_genericname=Clock
_categories="DockApp;WMAKER;"
_custom="StartupWMClass=wmitime"
_icon="GNUstep3D"

prepare() {
  cd "$srcdir/dockapps-26db447"
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
  cd "$srcdir/dockapps-26db447"
  make
}

package() {
  cd "$srcdir/dockapps-26db447"
  install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim: set sw=2 et:
