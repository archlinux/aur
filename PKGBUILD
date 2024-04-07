# Maintainer: Ashely Roll <ash at digitalnemesis dot com>
# Maintainer: Jan Černý <cernyhonza at gmail dot com>


pkgname=astrodmx-capture
pkgver=2.6.3
pkgrel=1
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
sha256sums_x86_64=("8dac54dbcf53cd1b7e16839307b355bd7e6bf844f523a322f1cf53fd02dc7f20")
source_aarch64=("https://www.astrodmx-capture.org.uk/downloads/astrodmx/current/rpi/astrodmx-glibc-2.28_${pkgver}_manual-aarch64.tar.gz")
sha256sums_aarch64=("09d5ad8284063b210b553ce3794e33307959e3f6b25f0468f9b621a8561043bf")
source_armv7h=("https://www.astrodmx-capture.org.uk/downloads/astrodmx/current/rpi/astrodmx-glibc-2.28_${pkgver}_manual-armhf.tar.gz")
sha256sums_armv7h=("6747393ec72e130368298eaefd757bc444a676d93e72cb347f70f21b45b0ce4e")

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
