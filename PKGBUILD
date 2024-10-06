# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@archlinux.org>
# Contributor: ValHue <vhuelamo at gmail dot com>

pkgname=java17-openjfx-bin
pkgver=17.0.12
pkgrel=1
pkgdesc="Java OpenJFX ${pkgver} client application platform (Gluon build)."
arch=('x86_64')
url='https://openjfx.io/'
license=('GPL-2.0-only')
depends=('ffmpeg' 'gstreamer' 'java-environment=17' 'libxtst' 'qt5-base' 'webkit2gtk')
provides=("java17-openjfx" "java-openjfx=17")
conflicts=("java17-openjfx")
options=(!strip)
source=("https://download2.gluonhq.com/openjfx/${pkgver}/openjfx-${pkgver}_linux-x64_bin-sdk.zip"
        "https://download2.gluonhq.com/openjfx/${pkgver}/openjfx-${pkgver}_linux-x64_bin-jmods.zip"
        "https://download2.gluonhq.com/openjfx/${pkgver}/openjfx-${pkgver}-javadoc.zip")
sha256sums=('f8bb2724d250595dad55b2886ceab19a8462515863f609a0b5462529d725e9e8'
            'f22bad50a4a0f4932ed999dcecccb59f188c22ea844d777512f3175e8ebb4024'
            'c96228f0148ec0413c1ec78e298ed94ea85ddc2b84b295cc03ca4c23e5f931b0')

_jvmdir=usr/lib/jvm/java-17-openjdk

package() {
    # Install
    install -d "${pkgdir}/${_jvmdir}"
    cp -a "javafx-sdk-${pkgver}/lib" "${pkgdir}/${_jvmdir}/"
    # Copy source archive
    cp -a "javafx-sdk-${pkgver}/src.zip" "${pkgdir}/${_jvmdir}/"
    mv "${pkgdir}/${_jvmdir}/src.zip" "${pkgdir}/${_jvmdir}/lib/javafx-src.zip"
    # Legal
    install -d "${pkgdir}/usr/share/licenses/java17-openjdk"
    cp -a "javafx-sdk-${pkgver}/legal" "${pkgdir}/usr/share/licenses/java17-openjfx/"
    # Jmods
    install -d "${pkgdir}/${_jvmdir}/jmods"
    cp -a "javafx-jmods-${pkgver}/"* "${pkgdir}/${_jvmdir}/jmods/"
    # Docs 
    install -d "${pkgdir}/usr/share/doc/java17-openjfx"
    cp -a "javafx-${pkgver}-javadoc/"* "${pkgdir}/usr/share/doc/java17-openjfx/"
}

# vim:set ts=4 sw=2 et syn=sh ft=sh:
