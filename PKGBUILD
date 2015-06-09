pkgname=cryptopp
pkgver=5.6.2
pkgrel=2
pkgdesc='free C++ class library of cryptographic schemes'
arch=('i686' 'x86_64')
license=('Boost')
makedepends=('unzip')
source=(http://www.cryptopp.com/cryptopp562.zip)
noextract=('cryptopp562.zip')
md5sums=('7ed022585698df48e65ce9218f6c6a67')
url=(http://www.cryptopp.com/)

prepare() {
	mkdir -p $srcdir/$pkgname
	cd $srcdir/$pkgname
	unzip -o $srcdir/cryptopp562.zip
	sed -i -e 's/# \(CXXFLAGS += -fPIC\)/\1/' GNUmakefile

}

build() {
	cd $srcdir/$pkgname
	make dynamic
}

package() {
	cd $srcdir/$pkgname
	make PREFIX="$pkgdir/usr" install
	rmdir $pkgdir/usr/bin
}

