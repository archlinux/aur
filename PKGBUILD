# Maintainer: L B <leobaldin dot 2000 at gmail dot com>

pkgname=java-openjfx-bin
_majorver=23.0.1
pkgver=23
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
sha256sums=('9ba7e61802029e41a9526ec9a98533b6f543fa508fbae7d548886d8ae7100349'
            '2164bca470bf70a5e2764645e2078ba7f787b274e5be3d7df30d87c5bb62bba6'
            '134f3ffc254471a8de973136c0b47eddcc026fd500faa1ca37e3b4fa292fbfe1')

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
