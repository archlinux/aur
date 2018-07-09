# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=myhtml
pkgver=4.0.4
pkgrel=1
pkgdesc="Fast HTML parser using threads implemented as a pure C99 library with no outside dependencies"
arch=('i686' 'x86_64')
makedepends=('git')
url="https://github.com/lexborisov/myhtml"
license=('LGPL')
source=("https://github.com/lexborisov/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f254ac87863e59bd64e856275af2618b968389728317f76e0278ebb938a644d2')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	msg2 'Building...'
	make CFLAGS=-Wno-pedantic prefix=/usr
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	msg2 'Installing license...'
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname%-git}/LICENSE

	msg2 'Installing documentation...'
	install -Dm644 README.md "$pkgdir"/usr/share/doc/${pkgname%-git}/README.md
	cp -dpr --no-preserve=ownership examples "$pkgdir"/usr/share/doc/${pkgname%-git}

	msg2 'Installing pkg-config...'
	install -Dm644 myhtml.pc "$pkgdir"/usr/lib/pkgconfig/myhtml.pc

	msg2 'Installing...'
	make prefix="$pkgdir/usr/" install
}
