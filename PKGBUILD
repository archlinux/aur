# Maintainer: Ashely Roll <ash at digitalnemesis dot com>

pkgname=sierrawireless-swiflash-zip
pkgver=5.1
pkgrel=1
pkgdesc="Sierra Wireless swiflash firmware update tool for WP/AR Legato USB connected devices"
arch=('x86_64')
url="https://source.sierrawireless.com/resources/airprime/software/swiflash"
# NOTE: no licence file is available in the ZIP, however there is one in the DEB available
#       from the url above. This indicates GPL2.
license=(GPL2)
options=()
install=$pkgname.install

source=("http://downloads.sierrawireless.com/tools/swiflash/swiflash.zip")
sha256sums=("3ebc106f001174225a78aef98b12c130ce0d91e9ee77b72285ce0843f233d08c")

_instdir="/opt/sierrawireless/swiflash"

package() {
	# create the desitination folder
	mkdir -p "${pkgdir}${_instdir}"

	# copy over the linux 64 bit files
	cp --recursive linux64 "${pkgdir}${_instdir}"
	cp --recursive reset "${pkgdir}${_instdir}"
	cp swiflash "${pkgdir}${_instdir}"
	cp readme.html "${pkgdir}${_instdir}"

	# udev rules
	mkdir -p "${pkgdir}/etc/udev/rules.d"
	cp 99-sierrawireless-modem.rules "${pkgdir}/etc/udev/rules.d"
	cp 99-sierrawireless-modem.rules "${pkgdir}${_instdir}"

	# create a profile file to add swiflash to users path
	mkdir -p "${pkgdir}/etc/profile.d"
	echo "export PATH=\"\$PATH\":'${_instdir}'" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
}

