# Maintainer: izmntuk
pkgname=vt100-parser
pkgver=1.0
pkgrel=1
pkgdesc='A VT100-compatible, output-only terminal emulator for parsing script(1) typescript.'
url='https://github.com/MarkLodato/vt100-parser'
depends=(python)
license=(MIT)
arch=(any)
source=("https://github.com/MarkLodato/vt100-parser/archive/v${pkgver}.tar.gz")

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	rst2man --title VT100-PARSER README.rst vt100.py.1
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make test
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -d "${pkgdir}/usr/share"/{doc,licenses}/"${pkgname}" "${pkgdir}"/usr/{share/man/man1,bin}
	install -pm644 CHANGELOG NOTES README.rst TODO "${pkgdir}/usr/share/doc/${pkgname}"
	install -pm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
	install -pm755 rawcat vt100.py "${pkgdir}/usr/bin"
	install -pm644 vt100.py.1 "${pkgdir}/usr/share/man/man1"
}

sha512sums=('52589121ae9f91ddf239dd33600013d4594bbc7e9edf36e6a6614fb65f249030363320c3e60299b9ca43acec87277a00758227ccc2c6a51b20d981e2664e58e1')
