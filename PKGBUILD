# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Xavier Benderitter <phenomenologeek at gmail.com>
pkgname=wmmoonclock
_name=wmMoonClock
pkgver=1.27
pkgrel=2
pkgdesc="WindowMaker dockapp that shows lunar ephemeris to fairly high accuracy"
arch=('i686' 'x86_64')
url="http://www.cs.mun.ca/~gstarkes/wmaker/dockapps/time.html#wmmoonclock"
license=('GPL')
depends=('libxpm')
source=("http://www.cs.mun.ca/~gstarkes/wmaker/dockapps/files/wmMoonClock-1.27.tar.gz"
	"classhint.patch")
md5sums=('c85bc974e70c867d556805505d3be48c'
         '03685215040f4cf4cc42e2697db786b0')

prepare() {
  cd "$srcdir/$_name-$pkgver/Src"
  patch -Np3 -b -z .orig <../../classhint.patch
  cat>$_name.desktop<<-PBEOF
	[Desktop Entry]
	Encoding=UTF-8
	Type=Application
	Name=$_name
	GenericName=Moon Ephemeris
	Comment=$pkgdesc
	Exec=$_name
	TryExec=/usr/bin/$_name
	Icon=$_name
	Terminal=false
	StartupNotify=false
	Categories=DockApp;WMAKER;
	StartupWMClass=$_name
	X-Arch-Package=$pkgname
PBEOF
}

build() {
  cd "$srcdir/$_name-$pkgver/Src"
  make
}

package() {
  cd "$srcdir/$_name-$pkgver/Src"
  install -Dm0755 $_name "$pkgdir/usr/bin/$_name"
  install -Dm0644 $_name.1 "$pkgdir/usr/share/man/man1/$_name.1"
  install -Dm0644 $_name.desktop "$pkgdir/usr/share/applications/$_name.desktop"
}
