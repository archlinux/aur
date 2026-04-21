# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=20.0.0rc1
pkgrel=2
epoch=1
pkgdesc="SlimeVR FBT software beta version"
arch=('x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server/"
license=('MIT','Apache-2.0')

depends=('alsa-lib' 'at-spi2-core' 'cairo' 'gtk3' 'jre17-openjdk' 'libcups' 'libgcc' 'libstdc++' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'nspr' 'nss' 'pango')
optdepends=('libappindicator')

options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=(
	"SlimeVR-amd64-${pkgver}.deb"::"https://github.com/SlimeVR/SlimeVR-Server/releases/download/v20.0.0-rc.1/SlimeVR-amd64.deb"
)

sha512sums_x86_64=(
	"d7a11d31e38b060cb8cbf301e769c871c3ea6cd56354ffc32c56829613a75ae96ae2cd3878121302712ffb1b526563560ae42609bea7d81534dd9eab830e0ce3"
)

package() {
	tar -xJ -f data.tar.xz -C "${pkgdir}"
	mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"
	mv "${pkgdir}/opt/SlimeVR/69-slimevr-devices.rules" "${pkgdir}/usr/lib/udev/rules.d/"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/SlimeVR/slimevr" "${pkgdir}/usr/bin/slimevr"
}
