# Contributor: Rudy Matela <rudy@matela.com.br>
# Maintainer: Rudy Matela <rudy@matela.com.br>
pkgname=pngcheck
pkgver=3.0.2
pkgrel=1
pkgdesc="Verifies the integrity of PNG, JNG and MNG files by checking the CRCs and decompressing the image data"
arch=('i686' 'x86_64')
url="http://www.libpng.org/pub/png/apps/pngcheck.html"
license=('GPL')
depends=('libpng')
makedepends=('libpng')
source=("http://www.libpng.org/pub/png/src/${pkgname}-${pkgver}.tar.gz"
        'makefile.patch')
sha1sums=('ab9db8675e28b6191843870bad66658fa615a52d'
          '9962811ea70e6869ffb11515b70b9ccd0bf460ed')
sha256sums=('0d7e262f24116fddf2847a8ceb5c92d9f5f26efb42e9fff63ec2bb7676131ca7'
            '15660da01a14f29b6382d8efa533c08af0ff206346e7e974754c1d97ed4f3dd8')

prepare() {
	cd $srcdir/$pkgname-$pkgver
	cp Makefile.unx Makefile
	patch -p0 < $srcdir/makefile.patch
}

build() {
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -Dm755 pngcheck $pkgdir/usr/bin/pngcheck
	install -Dm755 pngsplit $pkgdir/usr/bin/pngsplit
	install -Dm755 png-fix-IDAT-windowsize $pkgdir/usr/bin/png-fix-IDAT-windowsize
}
