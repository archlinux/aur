# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=libmurmurhash
pkgver=1.5
pkgrel=1
pkgdesc="Portable MurmurHash Implementation"
url="https://github.com/kloetzl/libmurmurhash/"
license=("custom:publicdomain")
arch=("i686" "x86_64")
source=("https://github.com/kloetzl/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0d0c13bd56487f0cf01286c15a569b6d4506ccd3dd98202c50ca1b5c506fb415')

check() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
	make check
}

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	ln -r -s -T "${pkgdir}/usr/share/man/man3/murmurhash.3" "${pkgdir}/usr/share/man/man3/lmmh_x86_32.3"
	ln -r -s -T "${pkgdir}/usr/share/man/man3/murmurhash.3" "${pkgdir}/usr/share/man/man3/lmmh_x86_128.3"
	ln -r -s -T "${pkgdir}/usr/share/man/man3/murmurhash.3" "${pkgdir}/usr/share/man/man3/lmmh_x64_128.3"
	ln -r -s -T "${pkgdir}/usr/share/man/man3/murmurhash.3" "${pkgdir}/usr/share/man/man3/MurmurHash3_x86_32.3"
	ln -r -s -T "${pkgdir}/usr/share/man/man3/murmurhash.3" "${pkgdir}/usr/share/man/man3/MurmurHash3_x86_128.3"
	ln -r -s -T "${pkgdir}/usr/share/man/man3/murmurhash.3" "${pkgdir}/usr/share/man/man3/MurmurHash3_x64_128.3"
}

