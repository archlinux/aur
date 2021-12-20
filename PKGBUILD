pkgbase=acmt-acm500
pkgname=("${pkgbase}-vst" "${pkgbase}-vst3" "${pkgbase}-docs")
pkgver=2.1.0
pkgrel=1
arch=('x86_64')
url="https://www.acmt.co.uk/products/download-acm500/index.html"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	_archive="`xdg-user-dir DOWNLOAD`/acm-plugins-ACM500.tar.gz"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	tar -xvzf "${srcdir}/acm-plugins-ACM500.tar.gz"
	tar -xvzf "${srcdir}/ACM500/x86-64/plugin-binaries.tar.gz"
}

package_acmt-acm500-vst() {
	groups=('pro-audio' 'vst-plugins')
	pkgdesc="ACM500 Channel EQ (VST)"
	install -Dm755 ${srcdir}/plugin-binaries/VST/ACM500.so ${pkgdir}/usr/lib/vst/ACM500.so
}

package_acmt-acm500-vst3() {
	groups=('pro-audio' 'vst-plugins')
	pkgdesc="ACM500 Channel EQ (VST3)"
	mkdir -p ${pkgdir}/usr/lib/vst3
	rm -r ${srcdir}/plugin-binaries/VST3/ACM500.vst3/Contents/Resources
	cp -r ${srcdir}/plugin-binaries/VST3/ACM500.vst3 ${pkgdir}/usr/lib/vst3/ACM500.vst3
}

package_acmt-acm500-docs () {
	pkgdesc="ACM500 Channel EQ (Documentation)"
	install -Dm644 ${srcdir}/ACM500/manual.pdf ${pkgdir}/usr/share/doc/${pkgbase}/manual.pdf
}
