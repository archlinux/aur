# Maintainer: Dracomage <dracomage at disroot dot org>

pkgname=java21-openjfx-bin
pkgver=21.0.11
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
sha256sums=('9a69b4074f22bdb051ca0ae8e9794750621ef815c7657ccc51f89ba81ef2b624'
            '1c899cc64bf94248fd22b9fd1339c9f0fcfe97e6b2b6e6521e8c3589e47dfaf5'
            '2eca535a3686517dee6c8743dc195a7d8633f05e2ee72c0184b391a75335a1a3')

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
