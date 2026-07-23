# Maintainer: Dracomage <dracomage at disroot dot org>

pkgname=java21-openjfx-bin
pkgver=21.0.12
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
sha256sums=('9d4e3daa5f2ec07a8cacec2f8a8f56d487b99aadf757c18f5f1f1c2fb594740b'
            '87dbf03d39d2df3d232bd8d98cb6ad4920940d5251287f0cba61222b4e46a173'
            '253d3117bea1eb160d479a62671220b2b34ba8c89193682b78c0856bbe7c41b5')

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
