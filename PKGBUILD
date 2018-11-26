pkgname=kallisto
pkgver=0.45.0
pkgrel=1
pkgdesc='Quantify abundances of transcripts from RNA-Seq data'
url="http://pachterlab.github.io/$pkgname/"
license=(BSD)
arch=(i686 x86_64)
depends=(hdf5 zlib)
makedepends=(cmake autoconf automake)
source=("https://github.com/pachterlab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b32c74cdc0349c2fe0847b3464a3698da89212a507332a06291b6fc27b4e2305')

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
