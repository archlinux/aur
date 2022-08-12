# Maintainer: Mohammadreza Abdollahzadeh <morealaz[at]gmail[dot]com>
# Contributer: Felix Golatofski <contact@xdfr.de>
# Contributer: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=java-openjfx-ea-bin
_majorver=19
_buildver=10
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
sha256sums=('2143ff2db5ab6e8ca1aa5f608d40d7b5f59265c705194b5816792e151a55346c'
            '1894e7ca7eca12f3b7e74d2d7d78dd96512a922b87e2337318df63435402b20e'
            '9e9317e82e9415fc06800630028396346e54d39a79f2d2107e6da9bffeda6788')
sha512sums=('7db670f973c5ef78e6bf3152400444baaeda8099340a79667545e4931375f0e261a36f96ceb6861566eba5190273dd06e0580159cb0ce3dbee59d5aa0db651d3'
            'b8ccfa99d033df32d3f6a865ebfa2534bdeebbb299d7c59ec218861309d3b155421d715e0bdff6e10fb8253dcbcb2552e75ae3a61b073d85699543435e5b2258'
            '2ff39d1e5c3180895c529a7333f6502c2a55ad455f593fe1e62d8942a5a76e8f2e6bf1c6d458dc98eb5b56319d712d3d6b8c565f10fc295a1e9d8020ffc00b21')


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
# vim:set ts=4 sw=4 et:
