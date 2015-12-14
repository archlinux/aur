# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: andrewy <andrew@andrewyates.net>
#
pkgname=bbkeys
pkgver=0.9.1
pkgrel=9
pkgdesc="Blackbox tool for setting keyboard shortcuts for manipulating windows and virtual desktop"
arch=('i686' 'x86_64')
url="http://bbkeys.sourceforge.net/"
license=('custom')
groups=('blackbox')
depends=('libxext' 'libxft')
makedepends=('blackbox')
changelog="bbkeys.changelog"
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz"
	"bbkeys.desktop"
	"bbkeys.patch")
md5sums=('6bb7fdf50b7c2df4f9a12f4e16d76f66'
         'ff91c4fec02f829820b369d5a0a4d000'
         'c78d64536560a0e325f60544ac016019')

prepare() {
  cd $pkgname-$pkgver
  patch -Np2 -b -z .orig <../bbkeys.patch
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -m644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D "../bbkeys.desktop" "$pkgdir/usr/share/applications/bbkeys.desktop"
  install -m644 -D "../bbkeys.desktop" "$pkgdir/etc/xdg/autostart/bbkeys.desktop"
}
