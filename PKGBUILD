# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator-bin
pkgver=9.0.0
pkgrel=2
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('x86_64' 'aarch64')
url="https://github.com/iNavFlight/inav-configurator"

source_x86_64=(https://github.com/iNavFlight/inav-configurator/releases/download/9.0.0/INAV-Configurator_linux_x64_9.0.0.deb)
sha256sums_x86_64=('debd2bedfdcf0f79d0a30d13cb286e84b3f68f50ccdad11067fec98d3b42288e')

source_aarch64=(https://github.com/iNavFlight/inav-configurator/releases/download/9.0.0/INAV-Configurator_linux_arm64_9.0.0.deb)
sha256sums_aarch64=('6e03a5dab2ecb5e31cd52a848725f9c8d6defecc3d3a5bee7a73d5196cf6405f')

provides=('inav-configurator')
conflicts=('inav-configurator')
options=(!strip)
license=('GPL-3.0-only')
install=inav-configurator.install

package() {
	cd "$pkgdir"

	local deb_arch
	case "$CARCH" in
		x86_64)  deb_arch="x64" ;;
		aarch64) deb_arch="arm64" ;;
		*) echo "Unsupported architecture: $CARCH"; exit 1 ;;
	esac

	bsdtar -xf "$srcdir/INAV-Configurator_linux_${deb_arch}_$pkgver.deb"
	bsdtar -xf data.tar.*

	rm -rf DEBIAN
}
