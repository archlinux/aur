# Maintainer: Ashely Roll <ash at digitalnemesis dot com>

pkgname=sierrawireless-swicwe-zip
pkgver=1.25
pkgrel=1
pkgdesc="Sierra Wireless swicwe firmware packaging tool for WP/AR Legato devices"
arch=('x86_64')
url="https://source.sierrawireless.com/resources/airprime/software/swicwe"
# NOTE: no licence file is available in the ZIP, however there is one in the DEB available
#       from the url above. This indicates GPL2.
license=(GPL2)
options=()

source=("http://downloads.sierrawireless.com/tools/swicwe/swicwe.zip")
sha256sums=("f15a545c55b92c75de6728d0c262031e36eab007f464bced36104fe0377e26b1")

_instdir="/opt/sierrawireless/swicew"

package() {
	# create the desitination folder
	mkdir -p "${pkgdir}${_instdir}"

	# copy over the linux 64 bit files
	cp --recursive linux64 "${pkgdir}${_instdir}"
	cp readme.html "${pkgdir}${_instdir}"

	# create a profile file to add swiflash to users path
	mkdir -p "${pkgdir}/etc/profile.d"
	echo "export PATH=\"\$PATH\":'${_instdir}/linux64'" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
}

