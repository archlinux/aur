# Maintainer: Mohammadreza Abdollahzadeh <morealaz[at]gmail[dot]com>
# Contributer: Felix Golatofski <contact@xdfr.de>
# Contributer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=java-openjfx-ea-bin
_majorver=18
_buildver=7
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
sha256sums=('d7ad3e3db6fc977e0f6f3f928cc00ad26b7b333499bf7f2d2372741708d7fe94'
            'ff7adfb9534b77a15b73a989865b42742f9735d6f0a104288a4276c943d441f3'
            'f516286f2e3e8a94f315fa83ac5de54dfb2e0a58e55c93a776bac6caf289a20a')
sha512sums=('591da3b0662f37940595c0e68c332462a84996bcc2f6c3c2873661cab34c921b8775d6e48be995a317519012e8a8dbdb4353bcbed5dc6184ce47e38abf37e409'
            'ce1c607ffe6f86ce26ebf503d39f5d587af1984c57be0636f1e93bb92c2af0b316460be424e8d521c26c1b3c8845d955e819d666edafbf17ed2c2e07bd66f623'
            '945a3b733e3d7a6e558314118c53a72961fe226b82893bbf9f0407bd2baad5e68995d070b502758c7432d25816fa9ec951062596cea747f62ca4c151c633dba6')


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
