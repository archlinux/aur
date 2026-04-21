# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=20.0.0rc1
pkgrel=1
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
	"ef194d9c3dc4a043c2120cfa525bfd4510b3b1ade839695896abf256043b1cb96e4d9fcf7e58163997af4c5979f6385b8b62829fd5343bc33918007064f5f08a"
)

package() {
	tar -xJ -f data.tar.xz -C "${pkgdir}"
	mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"
	mv "${pkgdir}/opt/SlimeVR/69-slimevr-devices.rules" "${pkgdir}/usr/lib/udev/rules.d/"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/SlimeVR/slimevr" "${pkgdir}/usr/bin/slimevr"
}
