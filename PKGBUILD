# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=cwdaemon
pkgver=0.10.1
pkgrel=1
pkgdesc="Ham Radio Morse Code transmitter - text input is sent via udp port 6789."
arch=('i686' 'x86_64')
url="http://cwdaemon.sourceforge.net"
license=('GPL')
depends=('unixcw>=3.3.1' 'netcat')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
	diff.Makefile.am
	diff.Makefile.am.test)

prepare () {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.Makefile.am
	sed -i s:sbin:bin: src/Makefile.am
	patch -p0 < ../diff.Makefile.am.test
}

build() {
	cd $srcdir/$pkgname-$pkgver

	aclocal --force
	libtoolize --force
	autoheader -f
	automake -a -c -f 
	autoconf -f
			 
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make prefix=$pkgdir/usr install
}                                                  
md5sums=('681e02e48fb5a05c2e7bea0e63f5d94d'
         '4b641dbb07f9d9918ccbfb1e65a320cb'
         '4c8fa7d9783c6e00a57ed2376aad0f2c')
sha256sums=('5c914140aba395b5d52ba5d822bec9c22e05e93e38af9cfd212242adcaf6abcc'
            'abf5edafe536066ae299d72347035acd452ca93e73359fffcf3b40eee22dae5e'
            'ceab7697484eda01a322db232e8e1ab4a853db45ddabe3c84b916ab412f0aede')
