pkgname=kallisto
pkgver=0.46.0
pkgrel=1
pkgdesc='Quantify abundances of transcripts from RNA-Seq data'
url="http://pachterlab.github.io/$pkgname/"
license=(BSD)
arch=(i686 x86_64)
depends=(hdf5 zlib)
makedepends=(cmake autoconf automake)
source=("https://github.com/pachterlab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('af4778cf121cdb9f732b355fc0ce44c6708caddf22d9560ba7f4b5d5b9795be1')

build() {
	(
		cd "$srcdir/$pkgname-$pkgver/ext/htslib"
		autoreconf
	)
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd build
	make install
}
