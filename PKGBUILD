pkgname=inav-configurator-bin
pkgver=9.0.2
pkgrel=2
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('x86_64' 'aarch64')
url="https://github.com/iNavFlight/inav-configurator"

source_x86_64=(https://github.com/iNavFlight/inav-configurator/releases/download/untagged-58a74ccc453672f866b7/INAV-Configurator_linux_x64_9.0.2.deb)
sha256sums_x86_64=('247332476ee65bbbd031550ef0b7cae8f20f8e7094fcbca2d13a8123634d1e03')
sha256sums_aarch64=('cf3a1d557f9f3414511413ea0a6342af8f15d7054eac61f4106341b7c376d624')

source_aarch64=(https://github.com/iNavFlight/inav-configurator/releases/download/untagged-58a74ccc453672f866b7/INAV-Configurator_linux_arm64_9.0.2.deb)

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
