# Maintainer: Ashely Roll <ash at digitalnemesis dot com>

pkgname=astrodmx-capture
pkgver=0.68.1
pkgrel=1
pkgdesc="AstroDMx Capture Astronomical Imaging"
arch=('x86_64')
url="https://www.linux-astro-imaging.uk/"
# No licence file available in package, see https://www.linux-astro-imaging.uk/linux/astronomy/linux-downloads
# for details.
license=(custom)
options=(!strip)
install=$pkgname.install

source=("https://www.linux-astro-imaging.uk/sites/downloads/astrodmx_capture-0.68.1-manual-x86_64.tar.gz")
sha256sums=("31f66b5998b76d8853061a465d8aef53145d36aad27cfe16bb13624259c8e0ea")

_instdir="/usr/local/AstroDMx_Cpature"

package() {
	# create the desitination folder
	mkdir -p "${pkgdir}${_instdir}"

	# copy over the linux 64 bit files
	cp --recursive x86_64/usr/local/AstroDMx_Capture/* "${pkgdir}${_instdir}"

    # copy over the udev rules
    mkdir -p "${pkgdir}/etc/udev/rules.d"
    cp x86_64/etc/udev/rules.d/* "${pkgdir}/etc/udev/rules.d"

	# create a profile file to add an alias for astrodmx
    # this is needed because the application has to be launced from the bin folder
    # to correctly work, so we can't just add the path. sigh.
	mkdir -p "${pkgdir}/etc/profile.d"
	echo "alias astrodmx=\"pushd '${_instdir}/bin'; ./astrodmx_capture -D2; popd\"" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
}

