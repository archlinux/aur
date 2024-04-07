# Maintainer: Graham Bell <graham dot s dot bell at gmail dot com>
pkgname=fitsverify
pkgver=4.22
pkgrel=1
pkgdesc="A FITS file format-verification tool"
arch=('i686' 'x86_64')
url="https://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/"
license=('custom')
depends=('cfitsio<1:4.4.0')
conflicts=('cfitsio>=1:4.4.0')
source=("https://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/$pkgname-$pkgver.tar.gz")
md5sums=('ab2b6ba4f7efb9c1e0203eb537d9248f')

build() {
	cd "$srcdir/$pkgname-$pkgver"
        gcc -o fitsverify \
                ftverify.c fvrf_data.c fvrf_file.c fvrf_head.c \
                fvrf_key.c fvrf_misc.c \
                -DSTANDALONE \
                -lcfitsio
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        install -D fitsverify "$pkgdir/usr/bin/fitsverify"
        install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
