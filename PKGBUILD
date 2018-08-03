# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh-bin
pkgver=1.4.12
pkgrel=1
pkgdesc='A fully-modern text-based browser, rendering to TTY and browsers'
arch=('x86_64' 'i386' 'i486' 'i586' 'i686' 'armv6h' 'armv7h' 'aarch64')
url='https://www.brow.sh'
license=('LGPL2.1')
depends=('firefox>=57')
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
sha512sums_x86_64=('c16307fdc36b0807c4a6a4574573dfdc084311db97cd568fe643499f1f8e817cfa67b9c95dc75b789baf641dc20eeac01a65d1b58223f96a2ea8578d08384bcd')
sha512sums_i386=('f343eaa2de6ffd371a62fc0eeb9380abb81c453c547595d1f92ac42586e2fbfaadf7a1846afa30ea3bfbf2a17827ce0d61c58908bca1b00b8458d0a286377863')
sha512sums_i486=($sha512sums_i386)
sha512sums_i586=($sha512sums_i386)
sha512sums_i686=($sha512sums_i386)
sha512sums_armv6h=('93761530a2768c10587510edbd184c57e2eaade5c20bc3c11acc4bd035b9f8aa927758105d29e1f586b79dab05e81893586081c585998c46482c2599ac2b8e8c')
sha512sums_armv7h=('af998f94a4f79f98196e194cfcdbabdd54ca2215fee41406a4c9cea7a6e96b0a13aa639241482a686938d2ef4073ec8254a80d6173e07472d991950db8a5439d')
sha512sums_aarch64=('18ac01bc0795d4c53a21fe888cd39b11f642d000f618771f80f7a5913449be490143193bb199798f2d138241a27d4a3db91ca2f08f28fb2ddb7f4ddb03a45e34')

prepare() {
	cat ${provides[0]}_${pkgver}_linux_* > ${provides[0]}
	if [ $(which upx 2>/dev/null) ]; then
		echo Compressing ${provides[0]} with UPX...
		chmod u+x ${provides[0]}
		upx --best ${provides[0]}; fi
}

package() {
	install -Dm755 ${provides[0]} "$pkgdir/usr/bin/${provides[0]}"
}
