# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator-bin
pkgver=9.0.2
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('x86_64' 'aarch64')
url="https://github.com/iNavFlight/inav-configurator"

source_x86_64=(https://github.com/iNavFlight/inav-configurator/releases/download/untagged-58a74ccc453672f866b7/INAV-Configurator_linux_x64_9.0.2.zip)
sha256sums_x86_64=('a177aae2472477ebba106763af5ebf34002c9c3af343ee1b43a38e0f680283fe')

source_aarch64=(https://github.com/iNavFlight/inav-configurator/releases/download/untagged-58a74ccc453672f866b7/INAV-Configurator_linux_arm64_9.0.2.zip)
sha256sums_aarch64=('37ed8091f16da5415796474e89abcec07d7c0d7dea8a515a2906d81028b57390')

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
