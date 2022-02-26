pkgname=acmt-acm210-bin
pkgver=2.1.0
pkgrel=1
arch=('x86_64')
url="https://www.acmt.co.uk/products/download-acm210/index.html"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
pkgdesc="ACM210 Graphical EQ (VST/VST3)"
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')

prepare() {
	_archive="`xdg-user-dir DOWNLOAD`/acm-plugins-ACM210.tar.gz"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	tar -xvzf "${srcdir}/acm-plugins-ACM210.tar.gz"
	tar -xvzf "${srcdir}/ACM210/x86-64/plugin-binaries.tar.gz"
}

package() {
	## Install VST
	install -Dm755 "${srcdir}/plugin-binaries/VST/ACM210.so" "${pkgdir}/usr/lib/vst/ACM210.so"
	## Install VST3
	mkdir -p "${pkgdir}/usr/lib/vst3"
	cp -r "${srcdir}/plugin-binaries/VST3/ACM210.vst3" "${pkgdir}/usr/lib/vst3/ACM210.vst3"
}
