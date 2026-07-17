pkgname=inav-configurator-bin
pkgver=9.1.1
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('x86_64' 'aarch64')
url="https://github.com/iNavFlight/inav-configurator"

source_x86_64=(https://github.com/iNavFlight/inav-configurator/releases/download/$pkgver/INAV-Configurator_linux_x64_$pkgver.deb)
sha256sums_x86_64=('cf74be8e479224bd89b4703778c088fa1e278d324a9d1ae2cbd176e990cbe113')
sha256sums_aarch64=('1867f37f3d450798966e795450d2a102e572c6630ede95d7a9082984490d193b')

source_aarch64=(https://github.com/iNavFlight/inav-configurator/releases/download/$pkgver/INAV-Configurator_linux_arm64_$pkgver.deb)

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

	rm -rf DEBIAN debian-binary control.tar.* data.tar.*
}
