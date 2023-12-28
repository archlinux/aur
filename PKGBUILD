# Maintainer: Ashely Roll <ash at digitalnemesis dot com>
# Maintainer: Jan Černý <cernyhonza at gmail dot com>


pkgname=astrodmx-capture
pkgver=2.4.1
pkgrel=2
pkgdesc="AstroDMx Capture Astronomical Imaging"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.astrodmx-capture.org.uk/"
# No licence file available in package, see https://www.linux-astro-imaging.uk/linux/astronomy/linux-downloads
# for details.
license=(custom)
options=(!strip)
install=$pkgname.install
depends=('glibc>=2.27'
    'libgphoto2'
    'glu'
    'libtool'
    'gtk3'
    'at-spi2-core'
    'zlib'
    'libsm'
    'expat'
    'harfbuzz'
    'glib2'
    'gcc-libs'
    'gdk-pixbuf2'
    'curl'
    'pango'
    'libxtst'
    'libusb'
    'libglvnd'
    'systemd-libs'
    'libx11'
    'libxxf86vm'
    'freetype2'
    'libxml2'
    'fontconfig'
    'cairo'
    'libwebcam-git')

# The Author, Nicola, is now copying new releases into both the `current` and `old` folders so that we
# can maintain a constant path the file. Hopefully this will allow us to continue installing older versions
# without breakage after a new version is released. Thanks Nicola!
source_x86_64=("https://www.astrodmx-capture.org.uk/downloads/astrodmx/current/x86-64/astrodmx-capture_${pkgver}_x86-64-manual.tar.gz")
sha256sums_x86_64=("c4ff38d28a45b3dac7df14fc37637c4fb49ae68f2bea47aaeaa4e58623bf7ee5")
source_aarch64=("https://www.astrodmx-capture.org.uk/downloads/astrodmx/current/rpi/astrodmx-glibc-2.28_${pkgver}_manual-aarch64.tar.gz")
sha256sums_aarch64=("c6a4e24398c3b29bbdc0536a82e40131d2dc6c24370f53e3128161b61fab4345")
source_armv7h=("https://www.astrodmx-capture.org.uk/downloads/astrodmx/current/rpi/astrodmx-glibc-2.28_${pkgver}_manual-armhf.tar.gz")
sha256sums_armv7h=("88633213f3e2a6adc0034272ddaed3bb8866466f319825bdc6aa2d9641a0142d")

_instdir="/opt/AstroDMx-Capture"
_prefix="AstroDMx-${pkgver}-manual"


package() {
    # create the desitination folder
    mkdir -p "${pkgdir}${_instdir}"

    # copy over the linux 64 bit files
    cp --recursive ${_prefix}/opt/AstroDMx-Capture/* "${pkgdir}${_instdir}"

    # add xdg menu
    mkdir -p ${pkgdir}/etc/xdg/menus/applications-merged/
    cp "${_prefix}/etc/xdg/menus/applications-merged/astrodmx.menu" "${pkgdir}/etc/xdg/menus/applications-merged/"

    # copy usr share
    mkdir -p "${pkgdir}/usr/share/"
    cp -r ${_prefix}/usr/share/* "${pkgdir}/usr/share/"

    # copy over the udev rules
    mkdir -p "${pkgdir}/etc/udev/rules.d"
    cp ${_prefix}/etc/udev/rules.d/* "${pkgdir}/etc/udev/rules.d"

    # create a profile file to add an alias for astrodmx
    mkdir -p "${pkgdir}/etc/profile.d"
    echo "alias astrodmx=\"${_instdir}/bin/AstroDMx-Capture\"" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
}
