# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
# Contributor: ValHue <vhuelamo at gmail dot com>

pkgname=java17-openjfx-bin
pkgver=17.0.11
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
sha256sums=('f46a1fbea32b83cca6715d74cba7d9c24ce320f1da2daf8ff852f133e9f15674'
            'ba48a1021d3d4ca67bc79459665551daffaef9b07eb072fd2df4ad659ade96f5'
            '92695d1be7bd1d08562444ad5325cc9f08410b18a1f1aebb4a7cc96d854d6cfc')

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
