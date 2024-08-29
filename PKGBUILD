# Maintainer: Dracomage <dracomage at disroot dot org>

pkgname=java21-openjfx-bin
pkgver=21.0.4
pkgrel=2
pkgdesc="Java OpenJFX ${pkgver} client application platform (Gluon build)."
arch=('x86_64')
url='https://openjfx.io/'
license=('GPL-2.0-only')
depends=('ffmpeg' 'gstreamer' 'java-environment=21' 'libxtst' 'qt5-base' 'webkit2gtk')
provides=("java21-openjfx" "java-openjfx=21")
conflicts=("java21-openjfx")
options=(!strip)
source=("https://download2.gluonhq.com/openjfx/${pkgver}/openjfx-${pkgver}_linux-x64_bin-sdk.zip"
        "https://download2.gluonhq.com/openjfx/${pkgver}/openjfx-${pkgver}_linux-x64_bin-jmods.zip"
        "https://download2.gluonhq.com/openjfx/${pkgver}/openjfx-${pkgver}-javadoc.zip")
sha256sums=('110259a41bbc3c6d9d477b753d3ff7337ee78bc40b06405c40ddb6a68da748d4'
            '2412d689c724f60c39ea878d8a3bd4c6abfb5d9856cafc1cc8a49e28dc12d221'
            'c1c3c754ccc3bd1eaf8edb6f7004f9afa69f4d66d417234682a4074aa6558683')

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
