# Maintainer: Dracomage <dracomage at disroot dot org>

pkgname=java21-openjfx-bin
pkgver=21.0.10
pkgrel=1
pkgdesc="Java OpenJFX ${pkgver} client application platform (Gluon build)."
arch=('x86_64')
url='https://openjfx.io/'
license=('GPL-2.0-only')
depends=('ffmpeg' 'gstreamer' 'java-environment=21' 'libxtst' 'qt5-base')
optdepends=('webkit2gtk: Web content engine for GTK')
provides=("java21-openjfx" "java-openjfx=21")
conflicts=("java21-openjfx")
options=(!strip)
source=("https://download2.gluonhq.com/openjfx/${pkgver}/openjfx-${pkgver}_linux-x64_bin-sdk.zip"
        "https://download2.gluonhq.com/openjfx/${pkgver}/openjfx-${pkgver}_linux-x64_bin-jmods.zip"
        "https://download2.gluonhq.com/openjfx/${pkgver}/openjfx-${pkgver}-javadoc.zip")
sha256sums=('1d47e3291092145e2361b445a42dabcfbb89dcc9e1060ff4b8dfab64b9913fb4'
            '4f75b172da0512b7d561124830fa40dafd9421f4a36a70551a42a43729444bb1'
            '4c0deb72713b61636dfa966eb5e7abfb8086936164812cb13a4489fe11879321')

_jvmdir=usr/lib/jvm/java-21-openjdk

package() {
    # Install
    install -d "${pkgdir}/${_jvmdir}"
    cp -a "javafx-sdk-${pkgver}/lib" "${pkgdir}/${_jvmdir}/"
    # Copy source archive
    cp -a "javafx-sdk-${pkgver}/src.zip" "${pkgdir}/${_jvmdir}/"
    mv "${pkgdir}/${_jvmdir}/src.zip" "${pkgdir}/${_jvmdir}/lib/javafx-src.zip"
    # Legal
    install -d "${pkgdir}/usr/share/licenses/java21-openjdk"
    cp -a "javafx-sdk-${pkgver}/legal" "${pkgdir}/usr/share/licenses/java21-openjdk/"
    # Jmods
    install -d "${pkgdir}/${_jvmdir}/jmods"
    cp -a "javafx-jmods-${pkgver}/"* "${pkgdir}/${_jvmdir}/jmods/"
    # Docs
    install -d "${pkgdir}/usr/share/doc/java21-openjfx"
    cp -a "javafx-${pkgver}-javadoc/"* "${pkgdir}/usr/share/doc/java21-openjfx/"
}
