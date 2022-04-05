# Maintainer: taotieren <admin@taotieren.com>

pkgbase=nuclei-openocd
pkgname=(nuclei-openocd nuclei-openocd-bin)
pkgver=2022.04
pkgrel=1
pkgdesc="nuclei-openocd 是 Nuclei Studio IDE 的调试工具。"
arch=("x86_64")
makedepends=('libftdi-compat'  'libusb-compat'  'hidapi'  'libudev.so')
depends=()
optdepends=('nucleistudioide: Nuclei Studio IDE 是基于 MCU Eclipse IDE 开发的一款针对芯来公司处理器核产品的集成开发环境工具，用于 RISC-V 开发继承了 Eclipse IDE 平台的各种优势。'
			'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux'
			'embedded-studio-risc-v: Segger Embedded Studio for RISC-V')
conflicts=()
url="https://www.nucleisys.com/download.php"
license=('unknow')
options=(!strip)

source=("https://www.nucleisys.com/upload/files/toochain/openocd/nuclei-openocd-${pkgver}-linux-x64.tgz")
sha256sums=('658c8eca2faea4f6b15ab27e49da95dd027f87fef4eba9c2b59fd0a2ff268eff')

package_nuclei-openocd() {
	depends=('nuclei-openocd-bin')
}

package_nuclei-openocd-bin() {
	cd "$srcdir"

	msg2 'Installing Nuclei OpenOCD'
	install -dm755 "${pkgdir}/opt/nuclei/NucleiStudio/toolchain" \
					"${pkgdir}/opt/SEGGER/Embedded-Studio-RISC-V/Nuclei_Toolchain/"

	tar zxf "nuclei-openocd-${pkgver}-linux-x64.tgz"

	mv "Nuclei/openocd/${pkgver}/" "${pkgdir}/opt/nuclei/openocd"
	ln -sf "/opt/nuclei/openocd/" "${pkgdir}/opt/nuclei/NucleiStudio/toolchain/openocd"
	ln -sf "/opt/nuclei/openocd/" "${pkgdir}/opt/SEGGER/Embedded-Studio-RISC-V/Nuclei_Toolchain/openocd"
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
