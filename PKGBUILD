# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=pico8
pkgver=0.2.4c
pkgrel=10
pkgdesc='A fantasy console for making, sharing and playing tiny games and other computer programs.'
arch=('x86_64')
url='https://www.lexaloffle.com/pico-8.php'
license=('custom:pico8')
depends=('wget')
provides=('pico8'
          'pico-8')
conflicts=('pico-8')
source=("file://pico-8_${pkgver}_amd64.zip"
        "${pkgname}.desktop"
        "application-${pkgname}.xml")
sha256sums=('00967d08289d08f0fe275b21f9453734fb6c3d7f674191fa6026a0301e837d43'
            '9b846cd0fce9f3bebb06dfaf3a85f15bad8d95ae632d0271aace5748aa6a9242'
            '4d8aaaeb48541c779e19a5b9d262a3c3fe214b1a5a0946a4d1a64bc2795b5ecd')
options=('!strip')

package() {
    _dest="${pkgdir}"/opt/${pkgname}
    _share="${pkgdir}"/usr/share

    # desktop entry
    install -Dm644 application-${pkgname}.xml "${_share}"/mime/packages/application-${pkgname}.xml
    install -Dm644 ${pkgname}.desktop "${_share}"/applications/${pkgname}.desktop

    cd pico-8
    # executable
    install -D pico8 "${_dest}"/${pkgname}
    # data
    install -Dm644 -t "${_dest}" pico8.dat pico-8_manual.txt readme_linux.txt
    # license
    install -Dm644 license.txt "${_share}"/licenses/${pkgname}/LICENSE
    # desktop icon
    install -Dm644 lexaloffle-pico8.png "${_share}"/icons/${pkgname}.png
    
    # PATH symlink
    install -d "${pkgdir}"/usr/bin/
    ln -s /opt/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
