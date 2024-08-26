# Maintainer: Ashely Roll <ash at digitalnemesis dot com>
# Maintainer: Jan Černý <cernyhonza at gmail dot com>


pkgname=astrodmx-capture
pkgver=2.9.5
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
source_x86_64=("https://www.astrodmx-capture.org.uk/downloads/astrodmx/current/linux-x86_64/astrodmx-capture_${pkgver}_x86-64-manual.tar.gz")
sha256sums_x86_64=("c114ca87d7fc96e1756fe7587a4968085e4f6853f2d9e89104c07e9eaa863a65")
source_aarch64=("https://www.astrodmx-capture.org.uk/downloads/astrodmx/current/linux-arm/astrodmx-glibc-2.28_${pkgver}_manual-aarch64.tar.gz")
sha256sums_aarch64=("02ff1756d7bf0a1d5f2fbda6677f1eead28afa258658ff275f6af8c65d194fe8")
source_armv7h=("https://www.astrodmx-capture.org.uk/downloads/astrodmx/current/linux-arm//astrodmx-glibc-2.28_${pkgver}_manual-armhf.tar.gz")
sha256sums_armv7h=("653aa1d0f8a83a9eb1da894977321b341b6d7467d4da85aeb5f37b67548893f0")

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
