pkgname=acmt-acm70-bin
pkgver=3.1.0
pkgrel=1
arch=('x86_64')
url="https://www.acmt.co.uk/products/download-acm70/index.html"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
pkgdesc="ACM70 Mid-Range EQ (VST/VST3)"
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')

prepare() {
	_archive="`xdg-user-dir DOWNLOAD`/acm-plugins-ACM70.tar.gz"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	tar -xvzf "${srcdir}/acm-plugins-ACM70.tar.gz"
	tar -xvzf "${srcdir}/ACM70/x86-64/plugin-binaries.tar.gz"
}

package() {
	## Install VST
	install -Dm755 "${srcdir}/plugin-binaries/VST/ACM70.so" "${pkgdir}/usr/lib/vst/ACM70.so"
	## Install VST3
	mkdir -p "${pkgdir}/usr/lib/vst3"
	cp -r "${srcdir}/plugin-binaries/VST3/ACM70.vst3" "${pkgdir}/usr/lib/vst3/ACM70.vst3"
}
