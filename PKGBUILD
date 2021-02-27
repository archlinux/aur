pkgname=midicsv
pkgver=1.1
pkgrel=1
pkgdesc="Translates between MIDI and CSV."
arch=('i686' 'x86_64')
url="https://www.fourmilab.ch/webtools/midicsv/"
license=('custom')
source=($url$pkgname-$pkgver.tar.gz LICENSE)
md5sums=('f200bfbe630bd124b3a560d8592ed597'
         'a940c0fd0b9c66f8b6938bf38082a8d5')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	#./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i '/INSTALL_DEST/s#/usr/local#$(DESTDIR)/usr#' Makefile
	make DESTDIR="$pkgdir/" install
	install -D -m644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('f200bfbe630bd124b3a560d8592ed597'
         'a940c0fd0b9c66f8b6938bf38082a8d5')
