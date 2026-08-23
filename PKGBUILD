# Maintainer: Nilesh Kevlani <njkevlani@gmail.com>
pkgname=openlogi-bin
pkgver=v0.7.7
pkgrel=1
pkgdesc="A native, local-first alternative to Logitech Options+"
arch=('x86_64')
url="https://github.com/AprilNEA/OpenLogi"
license=('MIT' 'Apache')
provides=('openlogi')
options=('!emptydirs' '!strip')
makedepends=('libarchive') # For bsdtar

source=("https://github.com/AprilNEA/OpenLogi/releases/download/$pkgver/openlogi-$pkgver-linux-amd64.deb")
sha256sums=('2fdd52792c5952880d8d870f1a86ccb5e2bed36590014da3e78b5ef610a6256d')

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"

	# The upstream .deb ships this as a template and expands it from its
	# postinst script. Arch does not run Debian maintainer scripts, so expand it
	# here instead.
	sed -i 's|@BINDIR@|/usr/bin|g' \
		"${pkgdir}/usr/lib/systemd/user/openlogi-agent.service"

	# Remove Debian specific files or empty directories
	rm -rf "${pkgdir}/usr/share/doc"
	rm -rf "${pkgdir}/usr/share/lintian"
}
