# Maintainer: G4Zz0L1 <g4zz0l10@gmail.com>

pkgname=mod_maxminddb
pkgver=1.2.0
pkgrel=1
pkgdesc="This module allows you to query MaxMind DB files from Apache 2.2+ using the libmaxminddb library."
arch=('x86_64')
url="https://github.com/maxmind/mod_maxminddb"
license=('APACHE')
depends=('apache' 'libmaxminddb')
options=('!buildflags' '!emptydirs' 'staticlibs')
provides=("${pkgname}=${pkgver}")
source=("https://github.com/maxmind/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b6e114bcc2e89afaed63570c209b2868b613239d0fa91bd6e56af76b05a89f13')

build() {
	cd "$pkgname-$pkgver"
	sed -i 's|$(APXS) -i -a -n maxminddb .libs/mod_maxminddb.so||g' src/Makefile.in
	./configure
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm755 "src/.libs/mod_maxminddb.so" "$pkgdir/usr/lib/httpd/modules/mod_maxminddb.so"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
