# Maintainer: KafCoppelia <k740677208@gmail.com>

# BUILD INSTRUCTIONS:
#
# 1. Go to https://softwaretools.infineon.com/tools/com.ifx.tb.tool.modustoolboxsetup and login with your Infineon account.
# 2. Click on "Download" and download the current version
# 3. Download the .deb package and place it in the same directory as the PKGBUILD
# 4. Build

_pkgname=ModusToolboxSetup
pkgname=modustoolbox-setup
_pkgver=1.2
pkgver=${_pkgver}.0.787
pkgrel=1
pkgdesc="ModusToolbox Setup is the fastest and easiest way to install and update your ModusToolbox environment. Choose the tools, packs and patches you \
    need and add associated packages such as ModusToolbox Machine Learning and ModusToolbox Programming Tools."
arch=('x86_64')
license=("LicenseRef-${pkgname}")
depends=('fontconfig' 'libwebp' 'libglvnd' 'dbus' 'libxkbcommon' 'libxkbcommon-x11' 'pango' 'libsm' 'xcb-util-keysyms' 'xcb-util-wm' 'xcb-util-renderutil'  \
    'gtk3' 'xcb-util-image' 'libice' 'zstd' 'glib2' 'gcc-libs' 'freetype2' 'libxcb' 'libx11' 'glibc' 'qt6-base' 'libdrm' 'libcups' 'openssl' 'wayland')
url="https://softwaretools.infineon.com/tools/com.ifx.tb.tool.modustoolboxsetup"
_source="${_pkgname}Installer_${pkgver}_linux_x64.deb"
source=("file://${_source}")
sha256sums=('d3e20be112b55287ea31f91323733767d853ab2a40160f51c5141297f6b07f4f')
options=('!strip')


prepare() {
    cd ${srcdir}
    bsdtar -xf data.tar.gz -C ./
    rm data.tar.gz
    mv ./opt/Tools/${_pkgname} ./opt/
    # Remove the empty directory
    rm -r ./opt/Tools
    # Update link in desktop file
    sed -i "s/opt\/Tools/opt/" ./usr/share/applications/ModusToolbox-Setup-${pkgver}.desktop
}

package() {
    cp -ar ${srcdir}/opt ${pkgdir}/
    cp -ar ${srcdir}/usr ${pkgdir}/

    # Install license
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/usr/share/doc/ModusToolbox-Setup-${pkgver}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
