# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=rulex
pkgver=3.5.0
pkgrel=1
pkgdesc="Russian pronunciation dictionary aimed primarily for use together with the Ru_tts"
arch=('x86_64')
url="https://github.com/poretsky/rulex"
license=('GPL')
depends=('db')
source=("$pkgname-$pkgver.tar.gz::https://github.com/poretsky/${pkgname}/archive/refs/tags/r${pkgver}.tar.gz")
sha512sums=('f5eaee307a9a8ad08b3aff153b6e65b372fd7008bab6e8e02555abd41b3d474e26c9795096df10ad48c1e64202c486930aa92f7c909bad35d0bd83c5567ace37')
b2sums=('9e71ef8fc6a528d9632e3e5c0eee5d2d5233b6491e41da38b96e09d64cdb922677d9ee9aa23ed07928e9160b7c22cf852122517c3a0b33023db9127d155a49de')

build() {
	cd "$pkgname-r$pkgver"
	make prefix=/usr LFLAGS="$LDFLAGS"
}

package() {
	cd "$pkgname-r$pkgver"
	make prefix=/usr LFLAGS="$LDFLAGS" DESTDIR="$pkgdir/" install
	install -vDm 644 debian/{lexholder-ru.1,rulex.1} -t "${pkgdir}/usr/share/man/man1"
	install -vDm 644 debian/*.3 -t "${pkgdir}/usr/share/man/man3"
}
