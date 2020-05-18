# Maintainer: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=yacasl2
_pkgname=${pkgname^^}
pkgver=0.5p15
pkgrel=1
pkgdesc="A CASL II processing system"
arch=('x86_64')
url="https://github.com/j8takagi/YACASL2"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/j8takagi/YACASL2/archive/v$pkgver.tar.gz"
        "Makefile.patch")
sha256sums=("1dd17c9ad3236e144540ffa18e1e8fffb92c4ccfe58785ee158460d8348952de"
            "26c19ad47a56e355a89ef14caba0061c1d498853c45cbedc45e7c3e644bbafbc")

prepare() {
	cd "${_pkgname}-$pkgver"
	patch -p0 -i "$srcdir/Makefile.patch"
}

build() {
	cd "${_pkgname}-$pkgver"
	make
}

check() {
	cd "${_pkgname}-$pkgver"
	make -k check
}

package() {
	cd "${_pkgname}-$pkgver"
	make install prefix="$pkgdir/usr"
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
