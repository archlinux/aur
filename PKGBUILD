# Maintainer: setBoolean <setboolean@icloud.com>
pkgname="goshimmer-bin"
_pkgname="goshimmer"
pkgver="0.5.6"
pkgrel="2"
pkgdesc="GoShimmer implementation of Coordicide (official precompiled binary)"
arch=('x86_64')
url="https://github.com/iotaledger/goshimmer"
license=("Apache")
source=("https://github.com/iotaledger/goshimmer/releases/download/v${pkgver}/${_pkgname}-${pkgver}_Linux_x86_64.tar.gz"
		"goshimmer.service")
sha256sums=('e8a2556ae6e119567a0eb5d8bee4c26e9c8a8cbc576d9db64572d532db41b71d'
            '37e021ce73e05f1878896de42c76877a68fe6a678294bda0de3934b1f5a0d9c8')
backup=('etc/goshimmer/config.json')
install=goshimmer.install

package() {
	cd "${srcdir}"

	# Move executable to /usr/bin

	mkdir -p "${pkgdir}/usr/bin/"
	cp goshimmer "${pkgdir}/usr/bin/"
	
	# Move files to /var/lib/goshimmer

	mkdir -p "${pkgdir}/var/lib/goshimmer/"
	cp snapshot.bin "${pkgdir}/var/lib/goshimmer/"
	cp README.md "${pkgdir}/var/lib/goshimmer/"
	cp LICENSE "${pkgdir}/var/lib/goshimmer/"
	
	# Move config to standard location

	mkdir -p "${pkgdir}/etc/goshimmer/"
	cp config.json "${pkgdir}/etc/goshimmer/"
	
	# Install systemd service

	mkdir -p "${pkgdir}/usr/lib/systemd/system/"
	cp goshimmer.service "${pkgdir}/usr/lib/systemd/system/"
}
