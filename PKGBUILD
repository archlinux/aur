pkgbase=acmt-acm5a
pkgname=("${pkgbase}-vst" "${pkgbase}-vst3" "${pkgbase}-docs")
pkgver=3.1.0
pkgrel=1
arch=('x86_64')
url="https://www.acmt.co.uk/products/download-acm-5a/index.html"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	_archive="`xdg-user-dir DOWNLOAD`/acm-plugins-ACM-5A.tar.gz"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	tar -xvzf "${srcdir}/acm-plugins-ACM-5A.tar.gz"
	tar -xvzf "${srcdir}/ACM-5A/x86-64/plugin-binaries.tar.gz"
}

package_acmt-acm5a-vst() {
	groups=('pro-audio' 'vst-plugins')
	pkgdesc="ACM-5A Mid-Range EQ (VST)"
	install -Dm755 ${srcdir}/plugin-binaries/VST/ACM-5A.so ${pkgdir}/usr/lib/vst/ACM-5A.so
}

package_acmt-acm5a-vst3() {
	groups=('pro-audio' 'vst-plugins')
	pkgdesc="ACM-5A Mid-Range EQ (VST3)"
	mkdir -p ${pkgdir}/usr/lib/vst3
	rm -r ${srcdir}/plugin-binaries/VST3/ACM-5A.vst3/Contents/Resources
	cp -r ${srcdir}/plugin-binaries/VST3/ACM-5A.vst3 ${pkgdir}/usr/lib/vst3/ACM-5A.vst3
}

package_acmt-acm5a-docs () {
	pkgdesc="ACM-5A Mid-Range EQ (Documentation)"
	install -Dm644 ${srcdir}/ACM-5A/manual.pdf ${pkgdir}/usr/share/doc/${pkgbase}/manual.pdf
}
