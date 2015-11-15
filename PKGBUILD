# Original contributor: Ross Eldridge <ptepid@ptepid.org>
# Recovery by Ivo(sh) Musil <ivoshm@gmail.com>
pkgname=zssh
pkgver=1.5c
pkgrel=8
pkgdesc="SSH and Telnet client with ZMODEM file transfer capability"
arch=("i686" "x86_64")
license="GPL"
url="http://zssh.sourceforge.net/"
depends=("readline")
source=(http://vorboss.dl.sourceforge.net/project/zssh/zssh/1.5/$pkgname-$pkgver.tgz \
	04_GNU_openpty.patch \
	fix_CPPsymlink.patch)

md5sums=(\
	 '9f140ec2705a96d6a936b7dca0e8dd13'\
	 '8132f38155298a89b72636e0e0e316d4'\
	 '38d530c901a10117e56f145acc19b925'\
	)

prepare() {
        cd $srcdir/$pkgname-$pkgver

	patch -p1 < $srcdir/04_GNU_openpty.patch
	patch -p0 < $srcdir/fix_CPPsymlink.patch
}

build() {
	cd $srcdir/$pkgname-$pkgver
        ./configure --prefix=$pkgdir/usr
        make
}

package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/man/man1
	mkdir -p $pkgdir/usr/share/man/man1
	cd $srcdir/$pkgname-$pkgver
        make install
	chmod a+r $pkgdir/usr/bin/*
	mv $pkgdir/usr/man/man1/* $pkgdir/usr/share/man/man1/
	rm -rf $pkgdir/usr/man
}

