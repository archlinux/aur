# Maintainer: Jan Cerny <cernyhonza at gmail com>


pkgname=astrocrop
pkgver=1.1.1a
pkgrel=1
pkgdesc="Astronomical image preprocessing tool"
arch=('x86_64')
url="https://www.astrodmx-capture.org.uk/"
# No licence file available in package, see https://www.linux-astro-imaging.uk/linux/astronomy/linux-downloads
# for details.
license=(custom)
options=(!strip)
install=$pkgname.install
depends=('libxxf86vm' 'at-spi2-core' 'gtk2')

source=("https://www.astrodmx-capture.org.uk/downloads/other-software/astrocrop_${pkgver}_amd64.deb")
sha256sums=("d0ac01222721d63b41da0177696f161b73ae293285836b19ee577670359da193")

_instdir="/usr/local/AstroCrop"
_prefix="AstroCrop-${pkgver}-manual"


prepare() {
    mkdir ${_prefix}
    tar -xvf data.tar.xz -C ${_prefix}
}

package() {
    # create the desitination folder
    mkdir -p "${pkgdir}${_instdir}"

    # copy over the linux 64 bit files
    cp --recursive ${_prefix}/usr/local/AstroCrop/* "${pkgdir}${_instdir}"

    # copy usr share
    mkdir -p "${pkgdir}/usr/share/"
    cp -r ${_prefix}/usr/share/* "${pkgdir}/usr/share/"

    # create a profile file to add an alias for astrodmx
    mkdir -p "${pkgdir}/etc/profile.d"
    echo "alias astrocrop=\"${_instdir}/bin/launcher.sh\"" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
}
