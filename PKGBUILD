# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh-bin
pkgver=1.5.2
pkgrel=1
pkgdesc='A fully-modern text-based browser, rendering to TTY and browsers'
arch=('x86_64' 'i386' 'i486' 'i586' 'i686' 'armv6h' 'armv7h' 'aarch64')
url='https://www.brow.sh'
license=('LGPL2.1')
depends=('firefox>=63')
optdepends=('upx: compress binary')
provides=('browsh')
conflicts=('browsh' 'browsh-git')
options=('!strip')
source_x86_64=("https://github.com/${provides[0]}-org/${provides[0]}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux_amd64")
source_i386=("https://github.com/${provides[0]}-org/${provides[0]}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux_386")
source_i486=($source_i386)
source_i586=($source_i386)
source_i686=($source_i386)
source_armv6h=("https://github.com/${provides[0]}-org/${provides[0]}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux_armv6")
source_armv7h=("https://github.com/${provides[0]}-org/${provides[0]}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux_armv7")
source_aarch64=("https://github.com/${provides[0]}-org/${provides[0]}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux_arm64")
sha256sums_x86_64=('b6408aef158da086783cbf92b320d4d9e90da01edbc4872e5250df20b2982e07')
sha256sums_i386=('67c3a12763fa66834de881068c50fa68aeb5166b2ed088eba4e8ebca9c76b0e7')
sha256sums_i486=($sha256sums_i386)
sha256sums_i586=($sha256sums_i386)
sha256sums_i686=($sha256sums_i386)
sha256sums_armv6h=('35f9475f9a4041d490d0d4d7a5a9e628827fc901540a46e532310401f59c3632')
sha256sums_armv7h=('9e9540e9b3e10a7c980cf657b15a56e7616ef5490b81eb87b5e1ee3aefa29e6d')
sha256sums_aarch64=('78930fb01b0c508e3dd93779dfcb63e43c08bd0a723908c4989a2183bf184c8a')

prepare() {
	cat ${provides[0]}_${pkgver}_linux_* > ${provides[0]}
	if [ $(which upx 2>/dev/null) ]; then
		echo Compressing ${provides[0]} with UPX...
		chmod u+x ${provides[0]}
		upx ${provides[0]}; fi
}

package() {
	install -Dm755 ${provides[0]} "$pkgdir/usr/bin/${provides[0]}"
}
