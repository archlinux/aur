# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: M A <morealaz at gmail dot com>
# Contributer: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=java-openjfx-ea-bin
_majorver=15
_buildver=5
pkgver=${_majorver}rc${_buildver}
pkgrel=1
pkgdesc="Java OpenJFX ${_majorver} Early-Access Build."
arch=('x86_64')
url='https://openjfx.io/'
license=('GPL2')
depends=('java-openjdk-ea-bin' 'gstreamer' 'libxtst' 'webkit2gtk' 'ffmpeg' 'qt5-base')
provides=("java-openjfx=${_majorver}")
conflicts=("java${_majorver}-openjfx")
source=("https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}-ea+${_buildver}_linux-x64_bin-sdk.zip"
        "https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}-ea+${_buildver}_linux-x64_bin-jmods.zip"
        "https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}-ea+${_buildver}-javadoc.zip")
sha256sums=('297ad063b7c3cdfe8095771573ce7a59ab66e4fea7ef74b4a7b9ece29794474b'
            '63a40054191bcae8e39b59cf5f5da0796c6027ddc9690d7c5b8e28fff865d4eb'
            'abfc05817fec9e75a7d8218586eebf2086d72e859cc0e7d9d9e56c1be383c729')

_jvmdir=usr/lib/jvm/java-${_majorver}-openjdk

package() {
    # Install
    install -d "${pkgdir}/${_jvmdir}"
    cp -a "javafx-sdk-${_majorver}/lib" "${pkgdir}/${_jvmdir}/"
    mv "${pkgdir}/${_jvmdir}/lib/src.zip" "${pkgdir}/${_jvmdir}/lib/javafx-src.zip"
    # Legal
    install -d "${pkgdir}/usr/share/licenses/java${_majorver}-openjdk"
    cp -a "javafx-sdk-${_majorver}/legal" "${pkgdir}/usr/share/licenses/java${_majorver}-openjdk/"
    # Jmods
    install -d "${pkgdir}/${_jvmdir}/jmods"
    cp -a "javafx-jmods-${_majorver}/"* "${pkgdir}/${_jvmdir}/jmods/"
    # Docs 
    install -d "${pkgdir}/usr/share/doc/java${_majorver}-openjfx"
    cp -a "javafx-${_majorver}-javadoc/"* "${pkgdir}/usr/share/doc/java${_majorver}-openjfx/"
}
# vim:set ts=4 sw=4 et:
