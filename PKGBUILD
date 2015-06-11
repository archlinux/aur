# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmwork
pkgver=0.2.5
pkgrel=1
pkgdesc="A dock app that helps you keep track of time worked on projects"
arch=('i686' 'x86_64')
url="http://web.archive.org/web/20121028075048/http://dockapps.windowmaker.org/file.php/id/25"
license=('GPL')
depends=('libxpm')
source=("ftp://ftp.oregonstate.edu/.2/gentoo/distfiles/wmwork-0.2.5.tar.gz"
        "classhint.patch")
md5sums=('6680fa359430dcb4a987abb8973492c2'
         'a0654659d13a1433e8f872b32c36f816')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/src"
  patch -Np3 -b -z .orig <../../classhint.patch
  cat>$pkgname.desktop<<-PBEOF
	[Desktop Entry]
	Encoding=UTF-8
	Type=Application
	Name=$pkgname
	GenericName=Time Keeper
	Comment=$pkgdesc
	TryExec=/usr/bin/$pkgname
	Exec=$pkgname
	Icon=$pkgname
	Terminal=false
	StartupNotify=false
	Categories=DockApp;WMAKER;
	StartupWMClass=wmwork
	X-Arch-Package=$pkgname $pkgver-$pkgrel
PBEOF
}

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make DESTDIR="$pkgdir" install
  install -Dm0644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim: set sw=2 et:
