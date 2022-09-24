# Maintainer: L B <leobaldin dot 2000 at gmail dot com>

pkgname=java-openjfx-bin
_majorver=19
pkgver=19
pkgrel=1
pkgdesc="Java OpenJFX ${_majorver} client application platform (Gluon build)."
arch=('x86_64')
url='https://openjfx.io/'
license=('GPL2')
depends=('ffmpeg' 'gstreamer' 'java-environment>=11' 'libxtst' 'qt5-base' 'webkit2gtk')
provides=("java-openjfx=${pkgver}")
conflicts=("java${pkgver}-openjfx")
source=("https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}_linux-x64_bin-sdk.zip"
        "https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}_linux-x64_bin-jmods.zip"
        "https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}-javadoc.zip")
sha256sums=('7c4f4852dd1bdd2b6ed7b152445e8f1d35a7329f7eca46000b661acf7cb212d0'
            '452d030213b4df3047a5a542fc3858d4f96cba73941c5386b4b2759c4d56ba46'
            'ec97caefd4202a982cbb3a2993bdde58e45cf198c7538d84706e998100b92465')

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
