# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh-bin
pkgver=1.4.10
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
sha512sums_x86_64=('406ba54914e35cda4c50d03cb6c01723963f374d83ee95b5ccdbf48fb2ff30edab209656ee639425acf9d81b649d0ae06d8c9c2f8db85f94c25b9f8f3f23ba69')
sha512sums_i386=('190d0f4ef9f9a7858ea1c02d7b7dd45d63f115d707e137f05081b51beaf344032c4aeed8a82f7bea6dd16f1853a6b23b9ea6f19be43ff7556d0bd9f4705ebd46')
sha512sums_i486=($sha512sums_i386)
sha512sums_i586=($sha512sums_i386)
sha512sums_i686=($sha512sums_i386)
sha512sums_armv6h=('0acae3bf0fe8fbebf3c00384dd63812da183f9ac19ac3a6aea64328f3a8bc3f2eb5adcd15ff57c58a5084daf469d2e3576abfcd575f743737d1088884c98ed80')
sha512sums_armv7h=('d7e1af15f5ef33abb67afb440b179bd47ff6980e6298b823272002f83f9f9644d3c4003ca3f0d2cbdbbd0c12c7e0bd6af85b308dc55fc5b0c6ad0964bbcc85f4')
sha512sums_aarch64=('b798c501b31edddf4dcbf8efa2202023ddf70f8439f2e314c4a4ec7b47d954bf662557bf727ae22c975c4ac1be799b64962f1f0ae8ed849e51ad700be7ea1f70')

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
