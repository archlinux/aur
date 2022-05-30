# Maintainer: Mohammadreza Abdollahzadeh <morealaz[at]gmail[dot]com>
# Contributer: Felix Golatofski <contact@xdfr.de>
# Contributer: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=java-openjfx-ea-bin
_majorver=19
_buildver=7
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
sha256sums=('6c6ed01d5c9bca9266d7df4babeadfa5e0e48803b91eb2bfa70febeca431465b'
            'e03fe01564fd3b2782a1f19ea8bd62c40c59db34142899804686f3fbea9341db'
            '2861eac2e44e4798ad425af174e224b140d4338b5edc89fc5234c7f2e0da872e')
sha512sums=('789dbd7fab798d15f32ffdc1dd88e4622977c1bce389bb76da7ad50e8947d719ab32ef98a0eda55172228e506e0b3ae6ffcab83aa8325d230e14414e1106ec76'
            'a287c2fb1a379a45a0352783b8d533e5fb12f8c156ac981cbc4b96afcf99be9a9759ea7d5228378bb2a1b6eb0267a640769ef3c63a91e599b8b673533d2644a8'
            '67effdac19b77aa7d178b8c25fe2b3f82dacd3a35755970e69a8debabf7adbb203da37208b856b39c905862ca3222ac03f9c6d382936db8a865184c23d126c98')


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
