# Maintainer: L B <leobaldin dot 2000 at gmail dot com>

pkgname=java-openjfx-bin
_majorver=24
pkgver=24
pkgrel=1
pkgdesc="Java OpenJFX ${_majorver} client application platform (Gluon build)."
arch=('x86_64')
url='https://openjfx.io/'
license=('GPL2')
depends=('ffmpeg' 'gstreamer' 'java-environment>=11' 'libxtst' 'qt5-base' 'webkit2gtk')
provides=("java-openjfx=${pkgver}")
conflicts=("java${pkgver}-openjfx" "java-openjfx=${pkgver}")
options=(!strip)
source=("https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}_linux-x64_bin-sdk.zip"
        "https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}_linux-x64_bin-jmods.zip"
        "https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}-javadoc.zip")
sha256sums=('e735fa786a7375c525c49874ad7e591cc493ed560c494664223612cf5e124d11'
            '6a5415a97619a730de160116fea2a4515cafcd5587d166ec5016246c4c787d82'
            '2240ab5ca530be546d21abd55508ed5dd4e20a4cacc7877e39e93a04e1e46476')

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
