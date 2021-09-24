# Maintainer: Ashely Roll <ash at digitalnemesis dot com>


pkgname=astrodmx-capture
pkgver=1.0.5
pkgrel=1
pkgdesc="AstroDMx Capture Astronomical Imaging"
arch=('x86_64')
url="https://www.linux-astro-imaging.uk/"
# No licence file available in package, see https://www.linux-astro-imaging.uk/linux/astronomy/linux-downloads
# for details.
license=(custom)
options=(!strip)
install=$pkgname.install

source=("https://www.astrodmx-capture.org.uk/sites/downloads/astrodmx/current/x86-64/astrodmx-capture_${pkgver}_x86-64-manual.tar.gz")
sha256sums=("6887d53c2c6983253aa317837adc0d848dec180ae54a15cabb40ea5c37089a8b")

_instdir="/usr/local/AstroDMx_Capture"
_prefix="AstroDMx-${pkgver}-manual"

package() {
    # create the desitination folder
    mkdir -p "${pkgdir}${_instdir}"

    # copy over the linux 64 bit files
    cp --recursive ${_prefix}/usr/local/AstroDMx_Capture/* "${pkgdir}${_instdir}"

    # copy over the udev rules
    mkdir -p "${pkgdir}/etc/udev/rules.d"
    cp ${_prefix}/etc/udev/rules.d/* "${pkgdir}/etc/udev/rules.d"

    # create a profile file to add an alias for astrodmx
    mkdir -p "${pkgdir}/etc/profile.d"
    echo "alias astrodmx=\"${_instdir}/bin/AstroDMx-Capture\"" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
}
