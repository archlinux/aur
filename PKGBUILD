# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: andrewy <andrew@andrewyates.net>
#
pkgname=bbkeys
pkgver=0.9.2
pkgrel=1
pkgdesc="Blackbox tool for setting keyboard shortcuts for manipulating windows and virtual desktop"
arch=('i686' 'x86_64')
url="http://bbkeys.sourceforge.net/"
license=('custom')
groups=('blackbox')
depends=('blackboxwm')
source=("https://github.com/bbidulock/$pkgname/releases/download/rel-092/$pkgname-$pkgver.tar.lz"
	"bbkeys.desktop")
md5sums=('485da98b03cad8e918c7766878af18fd'
         'ff91c4fec02f829820b369d5a0a4d000')

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -m644 -D "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D "../bbkeys.desktop" "$pkgdir/usr/share/applications/bbkeys.desktop"
  install -m644 -D "../bbkeys.desktop" "$pkgdir/etc/xdg/autostart/bbkeys.desktop"
}
