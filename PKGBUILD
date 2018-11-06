pkgname=kallisto
pkgver=0.44.0
pkgrel=1
pkgdesc='Quantify abundances of transcripts from RNA-Seq data'
url="http://pachterlab.github.io/$pkgname/"
license=(BSD)
arch=(i686 x86_64)
depends=(hdf5 zlib)
makedepends=(cmake autoconf automake)
source=("https://github.com/pachterlab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('35a81201a56f4557697e6fe693dc6b701bbbd0a7b2b6e1c6c845ef816d67ca29')

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
