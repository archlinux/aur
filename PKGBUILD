# Maintainer: Jesse R Codling <codling@umich.edu>
_pkgname=radxa-firmware
pkgname=$_pkgname-git
pkgver=0.2.22.r0.e84f1d9
pkgrel=1
pkgdesc="Supplemental firmwares for Radxa boards"
arch=(any)
url="https://github.com/radxa-pkg/radxa-firmware/"
license=('custom')
groups=()
depends=('linux-firmware-whence')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=(!strip)
install=
source=("$_pkgname::git+https://github.com/radxa-pkg/radxa-firmware.git")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

upstream_firmwares=(
	"cypress/cyfmac43455-sdio.bin"
	"cypress/cyfmac43455-sdio.clm_blob"
	"r8a779x_usb3_v1.dlmem"
	"r8a779x_usb3_v2.dlmem"
	"r8a779x_usb3_v3.dlmem"
	"rtw89/rtw8852b_fw.bin"
	"arm/mali/arch10.8/mali_csffw.bin"
)

pkgver() {
	cd "$srcdir/${_pkgname}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, tags available
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	echo "  ->  Removing upstreamed files..."
	for f in "${upstream_firmwares[@]}"; do
		rm "$srcdir/${_pkgname}/firmware/$f"
	done
}

package() {
	mkdir -p "${pkgdir}/usr/lib/"

	cp -a "$srcdir/${_pkgname}/firmware/" "${pkgdir}/usr/lib/"


}
