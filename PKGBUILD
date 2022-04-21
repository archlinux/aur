# Maintainer: Mohammadreza Abdollahzadeh <morealaz[at]gmail[dot]com>
# Contributer: Felix Golatofski <contact@xdfr.de>
# Contributer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=java-openjfx-ea-bin
_majorver=19
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
sha256sums=('d1882d364a145952438625a68e30e576594eaf58143267d5fa2c755c7c587c16'
            'c4babb79e627a63da8cec6c661aa5ac26e5d70756a39686efadf512e28963a1f'
            '16ffaaf82a6f143a201ebc318e78e8faffd8a3967c7fc4efc61ceb9394393c0b')
sha512sums=('f17262e513b199efef2047ee6cc92dc07091040b79e44f7fcb6e0f37595651d6685ca444d28a61c36bf71e10f0701f37e1f0f3e344e01609949bbe44062cd364'
            '70a649a3a85a395f3ac6a58935e39773c265bbbbbbbc2fced3329b0c8caf31352c87698e1820859d86a62dff9341cdc9e15a65980cb47d92ca62bc288d634764'
            'a1141d991a4033f16e223191ade1a5b2de7f611d66059f56cba976b17b1d10e804dc4ca8799e009b1f179287e21e6791a80f96e63905635cd8d3b89cba1e4dec')


_jvmdir="usr/lib/jvm/java-${_majorver}-openjdk"

package() {
    # Install
    install -d "${pkgdir}/${_jvmdir}"
    cp -a "javafx-sdk-${_majorver}/lib" "${pkgdir}/${_jvmdir}/"
    install -Dm 644 "javafx-sdk-${_majorver}/src.zip" "${pkgdir}/${_jvmdir}/lib/javafx-src.zip"
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
# vim:set ts=4 sw=4:
