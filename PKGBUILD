pkgbase=acmt-acm510
pkgname=("${pkgbase}-vst" "${pkgbase}-vst3" "${pkgbase}-docs")
pkgver=3.1.0
pkgrel=1
arch=('x86_64')
url="https://www.acmt.co.uk/products/download-acm510/index.html"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	_archive="`xdg-user-dir DOWNLOAD`/acm-plugins-ACM510.tar.gz"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	tar -xvzf "${srcdir}/acm-plugins-ACM510.tar.gz"
	tar -xvzf "${srcdir}/ACM510/x86-64/plugin-binaries.tar.gz"
}

package_acmt-acm510-vst() {
	groups=('pro-audio' 'vst-plugins')
	pkgdesc="ACM510 Channel Compressor (VST)"
	install -Dm755 ${srcdir}/plugin-binaries/VST/ACM510.so ${pkgdir}/usr/lib/vst/ACM510.so
}

package_acmt-acm510-vst3() {
	groups=('pro-audio' 'vst-plugins')
	pkgdesc="ACM510 Channel Compressor (VST3)"
	mkdir -p ${pkgdir}/usr/lib/vst3
	rm -r ${srcdir}/plugin-binaries/VST3/ACM510.vst3/Contents/Resources
	cp -r ${srcdir}/plugin-binaries/VST3/ACM510.vst3 ${pkgdir}/usr/lib/vst3/ACM510.vst3
}

package_acmt-acm510-docs () {
	pkgdesc="ACM510 Channel Compressor (Documentation)"
	install -Dm644 ${srcdir}/ACM510/manual.pdf ${pkgdir}/usr/share/doc/${pkgbase}/manual.pdf
}
