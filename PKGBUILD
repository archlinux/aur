pkgbase=acmt-acm2a
pkgname=("${pkgbase}-vst" "${pkgbase}-vst3" "${pkgbase}-docs")
pkgver=3.1.0
pkgrel=1
arch=('x86_64')
url="https://www.acmt.co.uk/products/download-acm-2a/index.html"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	_archive="`xdg-user-dir DOWNLOAD`/acm-plugins-ACM-2A.tar.gz"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	tar -xvzf "${srcdir}/acm-plugins-ACM-2A.tar.gz"
	tar -xvzf "${srcdir}/ACM-2A/x86-64/plugin-binaries.tar.gz"
}

package_acmt-acm2a-vst() {
	pkgdesc="ACM-2A Program EQ (VST)"
	groups=('pro-audio' 'vst-plugins')
	install -Dm755 ${srcdir}/plugin-binaries/VST/ACM-2A.so ${pkgdir}/usr/lib/vst/ACM-2A.so
}

package_acmt-acm2a-vst3() {
	pkgdesc="ACM-2A Program EQ (VST3)"
	groups=('pro-audio' 'vst-plugins')
	mkdir -p ${pkgdir}/usr/lib/vst3
	rm -r ${srcdir}/plugin-binaries/VST3/ACM-2A.vst3/Contents/Resources
	cp -r ${srcdir}/plugin-binaries/VST3/ACM-2A.vst3 ${pkgdir}/usr/lib/vst3/ACM-2A.vst3
}

package_acmt-acm2a-docs () {
	pkgdesc="ACM-2A Program EQ (Documentation)"
	install -Dm644 ${srcdir}/ACM-2A/manual.pdf ${pkgdir}/usr/share/doc/${pkgbase}/manual.pdf
}
