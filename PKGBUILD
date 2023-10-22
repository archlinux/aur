# Maintainer: Thomas Hipp <thomashipp at gmail dot com>
pkgname=libco
pkgver=20
pkgrel=3
pkgdesc="Cooperative multithreading library"
arch=('x86_64')
url="https://github.com/higan-emu/libco"
license=('custom')
_hash="9b76ff4c5c7680555d27c869ae90aa399d3cd0f2"
_hashshort="${_hash:0:8}"
source=("${pkgname}-${pkgver}-${_hashshort}.tar.gz::https://github.com/higan-emu/${pkgname}/archive/${_hash}.tar.gz"
        "Makefile"
        "libco.pc")
sha256sums=('306c10b275f4f848852075310f2795ed35be47fe435310d423591446a33c64f8'
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
