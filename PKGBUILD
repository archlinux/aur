# Maintainer: KafCoppelia <k740677208@gmail.com>

# BUILD INSTRUCTIONS:
#
# 1. Go to https://softwaretools.infineon.com/tools/com.ifx.tb.tool.mtbeclipse and login with your Infineon account.
# 2. Click on "Download" and download the current version
# 3. Download the .deb package and place it in the same directory as the PKGBUILD
# 4. Build

pkgname=modustoolbox-eclipse
pkgver=2026.1.0.919
pkgrel=1
pkgdesc="Custom Eclipse IDE for ModusToolbox development."
arch=('x86_64')
license=("LicenseRef-${pkgname}")
depends=('alsa-lib' 'glibc' 'gtk3' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst')
optdepends=('webkit2gtk-4.1')
url="https://softwaretools.infineon.com/tools/com.ifx.tb.tool.mtbeclipse"
_source="mtbeclipse_${pkgver}_Linux_x64.deb"
source=("file://${_source}")
sha256sums=('78753c426ce9494fc9e1070fa6f2620944b39b146e69de7e2b2f9b8cc4652431')
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
