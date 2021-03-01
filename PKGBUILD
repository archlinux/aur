# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-avahi
pkgver=0.4
pkgrel=1
pkgdesc='Avahi bindings for GNU Guile'
arch=('x86_64' 'i686' 'armv7h')
url='https://www.nongnu.org/guile-avahi'
license=('LGPL3')
depends=('guile' 'avahi' 'gmp')
source=("https://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9dcc2810058cc87d8fa81a1fa8eb7a3892b2cc0a8786fb16fe88d260aa0ba669')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Regenerate configure to allow using Guile < 3.
	autoreconf -fi
	./configure --prefix=/usr \
		--with-guilemoduledir=/usr/share/guile/site/2.2 \
		--disable-rpath
	make
}

check(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
