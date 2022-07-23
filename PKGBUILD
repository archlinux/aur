# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=libicu53
pkgver=53.2
pkgrel=2
pkgdesc='International Components for Unicode library (version 53)'
arch=('x86_64')
url='https://icu.unicode.org'
license=('custom:icu')
depends=('gcc-libs')
provides=(libicu{data,i18n,io,test,tu,uc}.so.53)

source=("https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz")
sha512sums=('fa3a7c9e388d263d548a02a1e4a63358c24883b4b6d7b29715fb333b96ba193d6c1fef363dafb96097565cf4baf3c1e3be3da5ed1647edf30757a4a65286970b')

build() {
	cd icu/source
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--mandir=/usr/share/man \
		--sbindir=/usr/bin
	make
}

package() {
	cd icu/source
	make DESTDIR="${pkgdir}" install
	rm "${pkgdir}"/usr/lib/lib*.so
	rm -rf "${pkgdir}"/usr/{bin,include,lib/{icu,pkgconfig},share}
}
