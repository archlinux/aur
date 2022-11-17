# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributer: Felix Golatofski <contact@xdfr.de>
# Contributer: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=java-openjfx-ea-bin
_majorver=20
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
sha256sums=('b807a59aa648902a47e9759342e567c6e3da1ae6de5633fff436ce7d0754d189'
            '29f7efb24b686284c1ef772eb33816b244c067216f831355fff7d89b6b2edb97'
            '9c469250d8778deabcf3447a785b207738407dde2905a451dbb6ab1bc89b7eef')
sha512sums=('64dcbb00d0c8d028a8647634c110a2bace0b364afc964f9714f9c8bb7cfd82c68f89e0931b2df8abac80901ec2677ca302e0d9d78e406ee4f19ae92748ffbad2'
            '8dfb63b0d586f679ea575536f3d4911ff766a786ef62b5fad863e60ff6435cdf82e1ee545e7bfc67a06f51911367bdc92559f132d0b9a7020bfdb1aa4576b8c2'
            '5ab3a20ac8e58f39422d5e0c0739bcad1a44845bd6a76b8e0d9685e8d51d1a0707c37fd70f7917ca03ae28998660d5c0e84eeda5745a0bdac622091a3143b109')


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
