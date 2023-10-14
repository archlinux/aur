# Maintainer: Ashely Roll <ash at digitalnemesis dot com>
# Maintainer: Jan Černý <cernyhonza at gmail dot com>


pkgname=astrodmx-capture
pkgver=2.3.1
pkgrel=1
pkgdesc="AstroDMx Capture Astronomical Imaging"
arch=('x86_64')
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
source=("https://www.astrodmx-capture.org.uk/downloads/astrodmx/current/x86-64/astrodmx-capture_${pkgver}_x86-64-manual.tar.gz")
sha256sums=("e6700786ba85ed86352d1c460a0249f801ec93fd5fa2d02999613af51fc9d2c4")

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
