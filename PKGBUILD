# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=20.0.0rc1
pkgrel=3
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
	"6aa29a4ff51a76fd95f05a695d2b31fa0dcc1d94437bfd37317d2552744397c2c085c30cbdb9a76a143d46eee2d96efaea2535db5bdaf58637bf5f54f94fa823"
)

package() {
	tar -xJ -f data.tar.xz -C "${pkgdir}"
	mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"
	mv "${pkgdir}/opt/SlimeVR/69-slimevr-devices.rules" "${pkgdir}/usr/lib/udev/rules.d/"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/SlimeVR/slimevr" "${pkgdir}/usr/bin/slimevr"
}
