#Maintainer: Bazza <bazza@riseup.net>

pkgname=blender-rhubarb-lipsync
pkgver=3.0.1
pkgrel=1
pkgdesc="Blender Rhubarb Lipsync is an addon for Blender integrating Rhubarb Lip Sync to automatically generate mouth-shape keyframes from a pose library."
arch=('any')
url="https://github.com/scaredyfish/blender-rhubarb-lipsync"
license=('GPL')
source=("${pkgname}-v${pkgver}.tar.gz::https://codeload.github.com/scaredyfish/${pkgname}/tar.gz/refs/tags/v${pkgver}")

md5sums=('2336e7dbe56953da21eac5a09ab3cab1')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	rm .gitignore
	rm README.md
	rm package.sh
	rm -r img
}

package() {
	_blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]{1}\.[[:digit:]]{2}(?=)')
	install -d -m755 "${pkgdir}"/usr/share/blender/"${_blender}"/scripts/addons
	cp -a "${srcdir}"/${pkgname}-${pkgver} "${pkgdir}"/usr/share/blender/"${_blender}"/scripts/addons/${pkgname}
}
