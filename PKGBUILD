# Maintainer: Nilesh Kevlani <njkevlani@gmail.com>
pkgname=openlogi-bin
pkgver=v0.6.16
pkgrel=1
pkgdesc="A native, local-first alternative to Logitech Options+"
arch=('x86_64')
url="https://github.com/AprilNEA/OpenLogi"
license=('MIT' 'Apache')
provides=('openlogi')
options=('!emptydirs' '!strip')
makedepends=('libarchive') # For bsdtar

source=("https://github.com/AprilNEA/OpenLogi/releases/download/$pkgver/openlogi-$pkgver-linux-amd64.deb")
sha256sums=('46c7472898c10cd109f4e534dd5a3e4b31c9d0605a35f5a23b771eb88c1d0292')

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
