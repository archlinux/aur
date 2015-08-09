# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: eric <eric@archlinux.org>

pkgname=hexcurse
pkgver=1.55
pkgrel=3
pkgdesc="Versatile ncurses-based hex editor."
arch=('i686' 'x86_64')
url="http://directory.fsf.org/project/HexCurse/"
license=('GPL')
depends=('ncurses>=5.6-7')
options=('!makeflags')
source=("http://gd.tuwien.ac.at/opsys/linux/gentoo/distfiles/$pkgname-$pkgver.tar.gz" 
        "hexcurse-alloca.patch")
#source=("http://www.sourcefiles.org/Editors/Hex/$pkgname-$pkgver.tar.gz")
md5sums=('c9f9485490300b5111aa429eabfef789'
         'fb7723bff0411392fe410839f6105e4f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p0 < ../hexcurse-alloca.patch

  ./configure \
	--prefix=/usr \
	--mandir=/usr/share/man

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
