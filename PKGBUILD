# Maintainer: Nilesh Kevlani <njkevlani@gmail.com>
pkgname=openlogi-bin
pkgver=v0.7.1
pkgrel=1
pkgdesc="A native, local-first alternative to Logitech Options+"
arch=('x86_64')
url="https://github.com/AprilNEA/OpenLogi"
license=('MIT' 'Apache')
provides=('openlogi')
options=('!emptydirs' '!strip')
makedepends=('libarchive') # For bsdtar

source=("https://github.com/AprilNEA/OpenLogi/releases/download/$pkgver/openlogi-$pkgver-linux-amd64.deb")
sha256sums=('98c74be02ec48a9312d898b857ca3ea5539dd168a26a144554eac0bcfc30ceaa')

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
