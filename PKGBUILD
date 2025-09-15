# Maintainer: KafCoppelia <k740677208@gmail.com>

# BUILD INSTRUCTIONS:
#
# 1. Go to https://softwaretools.infineon.com/tools/com.ifx.tb.tool.mtbeclipse and login with your Infineon account.
# 2. Click on "Download" and download the current version
# 3. Download the .deb package and place it in the same directory as the PKGBUILD
# 4. Build

pkgname=modustoolbox-eclipse
pkgver=2025.8.0.775
pkgrel=1
pkgdesc="Custom Eclipse IDE for ModusToolbox development."
arch=('x86_64')
license=("LicenseRef-${pkgname}")
depends=('alsa-lib' 'python' 'perl' 'libx11' 'glibc' 'libxtst' 'libxi' 'java-runtime' 'libxext' 'libxrender' 'lib32-glibc')
url="https://softwaretools.infineon.com/tools/com.ifx.tb.tool.mtbeclipse"
_source="mtbeclipse_${pkgver}_Linux_x64.deb"
source=("file://${_source}")
sha256sums=('f667951cbafc1e99578f7d3e3a94578f854187783105c6f35267306ae9e1762f')
options=('!strip')


prepare() {
    cd ${srcdir}
    bsdtar -xf data.tar.zst -C ./
    rm data.tar.zst
    mv ./opt/Tools/ModusToolboxEclipse ./opt/
    # Remove the empty directory
    rm -r ./opt/Tools
    # Update link in desktop file
    sed -i "s/opt\/Tools/opt/" ./usr/share/applications/Eclipse-for-ModusToolbox-${pkgver}.desktop
}

package() {
    cp -ar ${srcdir}/opt ${pkgdir}/
    cp -ar ${srcdir}/usr ${pkgdir}/

    # Install license
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/usr/share/doc/Eclipse-for-ModusToolbox-${pkgver}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
