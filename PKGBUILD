# Maintainer: Mohammadreza Abdollahzadeh <morealaz[at]gmail[dot]com>
# Contributer: Felix Golatofski <contact@xdfr.de>
# Contributer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=java-openjfx-ea-bin
_majorver=19
_buildver=3
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
sha256sums=('548d9028ea8c3e5912b4e95e41f9cc7ac172b360a44d847ef370867ecca30fac'
            '528d1f81b0975740ceae822955208e638fab792505d009edfa3ebc7722432098'
            '62bcd1d1268d045b58d7e1c1347806c8fa3726babbe19d60452a3775790811d7')
sha512sums=('30d3d85bcc1283133fbdaf1ffb2587dddd744713d09b626323feb013add83756d4eaa14d1f04a122af6174b4121eca86c3ccd8eafdc0528bf0ca2272fa71a097'
            '8f5a5b8756f09585e1bbe2fb02596706cedfdec0e5938e314ea88d331008f0a1033e9271fb941da853016274377f9dc4385d9a176880bdf6b51f5dffdf0610cd'
            'e0db74e9d028fa74c09a1664418b316f9c164584e50de64142ba859ef9426688b14afa301e081f63f098d86d9769d5f4b27f116ffdc01b04c04a1b90eab33d7f')


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
