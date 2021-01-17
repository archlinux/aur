# Maintainer: Thomas Hipp <thomashipp at gmail dot com>
pkgname=libco
pkgver=20
pkgrel=2
pkgdesc="Cooperative multithreading library"
arch=('x86_64')
url="https://github.com/higan-emu/libco"
license=('custom')
_hash="a22bd9dba264e70ee7ea7dc2027af4b076890e43"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/higan-emu/${pkgname}/archive/${_hash}.tar.gz"
        "Makefile"
        "libco.pc")
sha256sums=('f3aa595380f1ea14da5f42de789ce5aa3d47c0920d1d5ca2785bfccfbe6332f2'
            'dcebf2d57105b348ae577bcd52213cdf47a13925cbb3d577322f423111796907'
            'dadf69b73b51dd360cb63f667e0f03d5e5e508bc8370ece8b35a29edb5db95a5')

prepare() {
    cp Makefile "$pkgname-${_hash}"
}

build() {
	cd "$pkgname-${_hash}"
	make
}

package() {
	cd "$pkgname-${_hash}"
	DESTDIR="${pkgdir}" make install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 doc/usage.md "${pkgdir}/usr/share/doc/${pkgname}/usage.md"
	install -Dm644 ${srcdir}/libco.pc "${pkgdir}/usr/lib/pkgconfig/${pkgname}.pc"
}
