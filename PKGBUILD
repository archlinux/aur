pkgname=pythia
pkgver=8.2.12
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Generation of high-energy physics events."
url="http://home.thep.lu.se/Pythia/"
license=('GPL')
depends=('zlib' 'boost')
makedepends=('autoconf' 'automake' 'make' 'gcc')
provides=('pkgname')
source=("http://home.thep.lu.se/~torbjorn/pythia8/pythia8212.tgz")
md5sums=('0886d1b2827d8f0cd2ae69b925045f40')

build(){
	cd $srcdir/$pkgname`echo $pkgver | tr -d '.'`
	./configure --enable-shared \
		    --enable-64bit \
		    --with-root \
		    --with-boost \
		    --with-gzip \
		    --prefix=/usr 
	make -j`nproc`
}

package() {
	cd $srcdir/$pkgname`echo $pkgver | tr -d '.'`
	make PREFIX_BIN="$pkgdir/usr/bin" \
	     PREFIX_INCLUDE="$pkgdir/usr/include" \
	     PREFIX_LIB="$pkgdir/usr/lib" \
	     PREFIX_SHARE="$pkgdir/usr/share/Pythia8" install
	chmod +x $pkgdir/usr/bin/pythia8-config
	mkdir -p $pkgdir/etc/profile.d
	cp ../../pythia.sh $pkgdir/etc/profile.d/pythia.sh
}
