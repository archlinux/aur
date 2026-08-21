# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@archlinux.org>
# Contributor: ValHue <vhuelamo at gmail dot com>

pkgname=java17-openjfx-bin
pkgver=17.0.19
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
sha256sums=('d5f70e96001872e84593f149dc6cb645f3bfbc71e519fa085608070c401f6d5e'
            'ab22097c4e6679547333172a017ced4e3210dc572f51a96a3be1d1dbfcd61f37'
            '428602563746012027c1e0549171a14180f2c77b07a3ecb758ea1f4352ef81f2')

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
