pkgname=acmt-acm510a-bin
pkgver=3.1.0
pkgrel=1
arch=('x86_64')
url="https://www.acmt.co.uk/products/download-acm510a/index.html"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
pkgdesc="ACM510AA Channel Dynamics (VST/VST3)"
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')

prepare() {
	_archive="`xdg-user-dir DOWNLOAD`/acm-plugins-ACM510A.tar.gz"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	tar -xvzf "${srcdir}/acm-plugins-ACM510A.tar.gz"
	tar -xvzf "${srcdir}/ACM510A/x86-64/plugin-binaries.tar.gz"
}

package() {
	## Install VST
	install -Dm755 "${srcdir}/plugin-binaries/VST/ACM510A.so" "${pkgdir}/usr/lib/vst/ACM510A.so"
	## Install VST3
	mkdir -p "${pkgdir}/usr/lib/vst3"
	cp -r "${srcdir}/plugin-binaries/VST3/ACM510A.vst3" "${pkgdir}/usr/lib/vst3/ACM510A.vst3"
}
