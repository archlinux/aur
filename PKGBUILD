# Maintainer: L B <leobaldin dot 2000 at gmail dot com>

pkgname=java-openjfx-bin
_majorver=21
pkgver=21
pkgrel=1
pkgdesc="Java OpenJFX ${_majorver} client application platform (Gluon build)."
arch=('x86_64')
url='https://openjfx.io/'
license=('GPL2')
depends=('ffmpeg' 'gstreamer' 'java-environment>=11' 'libxtst' 'qt5-base' 'webkit2gtk')
provides=("java-openjfx=${pkgver}")
conflicts=("java${pkgver}-openjfx")
options=(!strip)
source=("https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}_linux-x64_bin-sdk.zip"
        "https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}_linux-x64_bin-jmods.zip"
        "https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}-javadoc.zip")
sha256sums=('7d2fc17019540e04c1a0af7a333a8c7e0330d3a7f4579311d65e76320ea9a8c9'
            'bc897db4f320f803c5647aae59e01a8deab4893441787082f1c43514fd172e69'
            'bc3a082dda1a62ba2af612aae9b5b740012b7c307c6bbb70bfd1cc0fccce3858')

_jvmdir=usr/lib/jvm/java-${pkgver}-openjfx

package() {
    # Install
    install -d "${pkgdir}/${_jvmdir}"
    cp -a "javafx-sdk-${_majorver}/lib" "${pkgdir}/${_jvmdir}/"
    # Copy source archive
    cp -a "javafx-sdk-${_majorver}/src.zip" "${pkgdir}/${_jvmdir}/"
    mv "${pkgdir}/${_jvmdir}/src.zip" "${pkgdir}/${_jvmdir}/lib/javafx-src.zip"
    # Legal
    install -d "${pkgdir}/usr/share/licenses/java${pkgver}-openjdk"
    cp -a "javafx-sdk-${_majorver}/legal" "${pkgdir}/usr/share/licenses/java${pkgver}-openjdk/"
    # Jmods
    install -d "${pkgdir}/${_jvmdir}/jmods"
    cp -a "javafx-jmods-${_majorver}/"* "${pkgdir}/${_jvmdir}/jmods/"
    # Docs 
    install -d "${pkgdir}/usr/share/doc/java${pkgver}-openjfx"
    cp -a "javafx-${_majorver}-javadoc/"* "${pkgdir}/usr/share/doc/java${pkgver}-openjfx/"
}
