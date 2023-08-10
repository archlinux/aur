# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Jesse R Codling <codling@umich.edu>
_pkgname=radxa-firmware
pkgname=$_pkgname-git
pkgver=0.2.11.r0.46f7ef1
pkgrel=1
pkgdesc="Supplemental firmwares for Radxa boards"
arch=(any)
url="https://github.com/radxa-pkg/radxa-firmware/"
license=('custom')
groups=()
depends=()
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("$_pkgname::git+https://github.com/radxa-pkg/radxa-firmware.git")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

upstream_firmwares=(
	"cypress/cyfmac43455-sdio.bin"
	"cypress/cyfmac43455-sdio.clm_blob"
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

	cp -dr "$srcdir/${_pkgname}/firmware/" "${pkgdir}/usr/lib/"


}
