# Maintainer: KafCoppelia <k740677208@gmail.com>

# BUILD INSTRUCTIONS:
#
# 1. Go to https://softwaretools.infineon.com/tools/com.ifx.tb.tool.modustoolboxprogtools and login with your Infineon account.
# 2. Click on "Download" and download the current version
# 3. Download the .deb package and place it in the same directory as the PKGBUILD
# 4. Build

_pkgname=ModusToolboxProgtools
pkgname=modustoolbox-progtools
_pkgver=1.4.0
pkgver=${_pkgver}.1399
pkgrel=1
pkgdesc="Provides a cross-platform installation of several utilities that allow you to program flash on Infineon MCU and Kit devices."
arch=('x86_64')
license=("LicenseRef-${pkgname}")
depends=('fontconfig' 'libwebp' 'libglvnd' 'dbus' 'libxkbcommon' 'libxkbcommon-x11' 'pango' 'libsm' 'xcb-util-keysyms' 'xcb-util-wm' 'xcb-util-renderutil' \
    'openssl-1.1' 'gtk3' 'xcb-util-image' 'libice' 'zstd' 'systemd-libs' 'glib2' 'gcc-libs' 'zlib' 'freetype2' 'libxcb' 'libx11' 'glibc')
url="https://softwaretools.infineon.com/tools/com.ifx.tb.tool.modustoolboxprogtools"
_source="${_pkgname}_${pkgver}.deb"
source=("file://${_source}")
sha256sums=('355a387701600a0af35edbfa9ab6e93e47bf69226f97e3a4bcb2d7b6b6147d2f')
options=('!strip')
install="${pkgname}.install"


prepare() {
    cd ${srcdir}
    bsdtar -xf data.tar.gz -C ./
    rm data.tar.gz
    mv ./opt/Tools/${_pkgname}-1.4 ./opt/
    # Remove the empty directory
    rm -r ./opt/Tools
    # Update link in desktop file
    sed -i "s/opt\/Tools/opt/" ./usr/share/applications/ModusToolbox-Programming-Tools-${pkgver}.desktop
}

package() {
    cp -ar ${srcdir}/opt ${pkgdir}/
    cp -ar ${srcdir}/usr ${pkgdir}/

    # Install license
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/usr/share/doc/ModusToolbox-Programming-Tools-${pkgver}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
