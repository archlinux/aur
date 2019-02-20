# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=libmurmurhash
pkgver=1.4
pkgrel=1
pkgdesc="Portable MurmurHash Implementation"
url="https://github.com/kloetzl/libmurmurhash/"
license=("custom:publicdomain")
arch=("i686" "x86_64")
source=("https://github.com/kloetzl/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2771125c9edb5643e15a01a94302363e5d6c0aaffa1597100613b1fe3207365c')

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

