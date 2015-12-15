# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Zerial <fernando@zerial.org>

pkgname=waimea
pkgver=0.4.0
pkgrel=7
pkgdesc="A fast and highly customizable virtual multiple desktop window manager."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/waimea"
license=('GPL')
depends=('imlib2' 'libxft' 'libxrandr' 'libxinerama' 'perl')
source=("http://downloads.sourceforge.net/sourceforge/waimea/$pkgname-$pkgver.tar.bz2"
	"$pkgname.patch")
md5sums=('0ce2ce92451e4e757a75c958b6acb87a'
         'e2a11deb21f3c95edd3dca2bef1148c1')

prepare() {
  cd $pkgname-$pkgver
  patch -Np2 -b -z .orig -i ../$pkgname.patch
}

build() {
  cd $pkgname-$pkgver
  autoreconf -fiv
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $pkgname-$pkgver
  make prefix="$pkgdir/usr" mandir="$pkgdir/usr/share/man" install
}
