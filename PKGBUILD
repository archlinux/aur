pkgname=acmt-acm5a-bin
pkgver=3.1.0
pkgrel=1
arch=('x86_64')
url="https://www.acmt.co.uk/products/download-acm-5a/index.html"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
pkgdesc="ACM-5A Mid-Range EQ (VST/VST3)"
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')

prepare() {
	_archive="`xdg-user-dir DOWNLOAD`/acm-plugins-ACM-5A.tar.gz"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	tar -xvzf "${srcdir}/acm-plugins-ACM-5A.tar.gz"
	tar -xvzf "${srcdir}/ACM-5A/x86-64/plugin-binaries.tar.gz"
}

package() {
	## Install VST
	install -Dm755 "${srcdir}/plugin-binaries/VST/ACM-5A.so" "${pkgdir}/usr/lib/vst/ACM-5A.so"
	## Install VST3
	mkdir -p "${pkgdir}/usr/lib/vst3"
	cp -r "${srcdir}/plugin-binaries/VST3/ACM-5A.vst3" "${pkgdir}/usr/lib/vst3/ACM-5A.vst3"
}
