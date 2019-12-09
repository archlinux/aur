pkgname=kallisto
pkgver=0.46.1
pkgrel=1
pkgdesc='Quantify abundances of transcripts from RNA-Seq data'
url="http://pachterlab.github.io/$pkgname/"
license=(BSD)
arch=(i686 x86_64)
depends=(hdf5 zlib)
makedepends=(cmake autoconf automake)
source=("https://github.com/pachterlab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('492ef081395e8858fcd9832aceb8b61c79358f00afb45e6709146c0fb51dd231')

build() {
	(
		cd "$srcdir/$pkgname-$pkgver/ext/htslib"
		autoreconf
	)
	rm -rf build
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd build
	make install
}
