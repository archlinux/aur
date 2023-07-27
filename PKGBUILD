# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Jesse R Codling <codling@umich.edu>
pkgname=armbian-firmware-git
pkgver=20230716.125181c
pkgrel=3
pkgdesc="Armbian-Specific Linux Firmware Files, useful for some SBCs"
arch=(any)
url="https://github.com/armbian/firmware"
license=('custom')
depends=()
provides=("${pkgname%-git}" "linux-firmware")
options=(!strip)
conflicts=(linux-firmware)
install=
noextract=()
source=("firmware::git+${url}.git")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/firmware"

# Git, no tags available
	printf "%s.%s" "$(git log --date="format:%Y%m%d" --format="%ad" -n 1 HEAD)" "$(git rev-parse --short HEAD)"

}


package() {
	install -d "$srcdir/firmware" ${pkgdir}/usr/lib/firmware
	cp -rpdt ${pkgdir}/usr/lib/firmware/ "$srcdir/firmware"/*


}
