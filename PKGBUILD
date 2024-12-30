# Maintainer: KafCoppelia <k740677208@gmail.com>

# BUILD INSTRUCTIONS:
#
# 1. Go to https://softwaretools.infineon.com/tools/com.ifx.tb.tool.mtbeclipse and login with your Infineon account.
# 2. Click on "Download" and download the current version
# 3. Download the .deb package and place it in the same directory as the PKGBUILD
# 4. Build

_pkgname=ModusToolboxEclipse
pkgname=modustoolbox-eclipse
pkgver=3.4.0.290
pkgrel=1
pkgdesc="Custom Eclipse IDE for ModusToolbox development."
arch=('x86_64')
license=("LicenseRef-${pkgname}")
depends=('alsa-lib' 'python' 'perl' 'zlib' 'libx11' 'glibc' 'libxtst' 'libxi' 'java-runtime' 'freetype2' 'libxext' 'libxrender')
url="https://softwaretools.infineon.com/tools/com.ifx.tb.tool.mtbeclipse"
_source="mtbeclipse_${pkgver}_linux_x64.deb"
source=("file://${_source}")
sha256sums=('1baec6a0baeaf1de557d19a7c1719aa94d7213b691382181e93884a5d893686c')
options=('strip')


prepare() {
    cd ${srcdir}
    bsdtar -xf data.tar.gz -C ./
    rm data.tar.gz
    mv ./opt/Tools/${_pkgname} ./opt/
    # Remove the empty directory
    rm -r ./opt/Tools
    # Update link in desktop file
    sed -i "s/opt\/Tools/opt/" ./usr/share/applications/Eclipse-IDE-for-ModusToolbox-${pkgver}.desktop
}

package() {
    cp -ar ${srcdir}/opt ${pkgdir}/
    cp -ar ${srcdir}/usr ${pkgdir}/

    # Install license
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/usr/share/doc/Eclipse-IDE-for-ModusToolbox-${pkgver}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
