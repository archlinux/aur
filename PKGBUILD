# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=19.0.0rc1
pkgrel=0
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
	"https://github.com/SlimeVR/SlimeVR-Server/releases/download/v19.0.0-rc.1/SlimeVR-amd64.deb"
)

sha512sums_x86_64=(
	"1f04191372b36efab5236f8dc3be57c0312056acd5013f95d777998f80e1aa0e5a10b342712a3453624a15354654d3302f1f815267b77aae1a94328cfc0be0a1"
)

package() {

  tar -xJ -f data.tar.xz -C "${pkgdir}"
  mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"
  mv "${pkgdir}/opt/SlimeVR/69-slimevr-devices.rules" "${pkgdir}/usr/lib/udev/rules.d/"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/SlimeVR/slimevr" "${pkgdir}/usr/bin/slimevr"
  rm "${startdir}/SlimeVR-amd64.deb"
}
