# Maintainer: L B <leobaldin dot 2000 at gmail dot com>

pkgname=java-openjfx-bin
_majorver=24.0.2
pkgver=24.0.2
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
sha256sums=('d419c2b6e0053ee184530e39448e6abb5962a5c18143201db4adbf40db817420'
            '20f3d03022f28039e6da2f8dce3fe42fb81e3984bbc63cc732663074fc2ecb1d'
            '52b714a1f67f4dc04d0e481cb4c4c0d2b61e893bfcd8b1c8ea43b9a706823c0b')

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
