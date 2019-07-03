# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh-bin
pkgver=1.6.4
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
sha256sums_x86_64=('d0bbdfe07e1494bb097dcff6290f17f98f6e3e5546f17139223b75d97c1caab5')
sha256sums_i386=('43969b4af481c387303ce44357d4f912f250bb00a13c094968809e36fd7988e5')
sha256sums_i486=($sha256sums_i386)
sha256sums_i586=($sha256sums_i386)
sha256sums_i686=($sha256sums_i386)
sha256sums_armv6h=('39d8048ae084d5b9229d1e89e882b52268dfe950c939c79c8d1de640a6914514')
sha256sums_armv7h=('36f02b21cbac554e1ca05e382560bf10043b402d2c345cbfffa9f1f20992bec2')
sha256sums_aarch64=('59505d1ffb45e986693be28250a2ef561cb09af616b11aa77c786cb7ab144181')

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
