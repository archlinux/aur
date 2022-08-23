# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=pico8
pkgver=0.2.4c
pkgrel=7
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
            'a2bc1eea115b86f5670b89914b3f9cb35577ca52f005e71d0afb4c7a42408d57'
            '4d8aaaeb48541c779e19a5b9d262a3c3fe214b1a5a0946a4d1a64bc2795b5ecd')

package() {
    _dest="${pkgdir}"/opt/${pkgname}
    _share="${pkgdir}"/usr/_share

    # desktop entry
    install -D application-${pkgname}.xml "${_share}"/mime/packages/application-${pkgname}.xml
    install -D ${pkgname}.desktop "${_share}"/applications/${pkgname}.desktop

    cd pico-8
    # executable
    install -Dm755 pico8 "${_dest}"/${pkgname}
    # data
    install -D -t "${_dest}" pico8.dat pico-8_manual.txt readme_linux.txt
    # license
    install -D license.txt "${_share}"/licenses/${pkgname}/LICENSE
    # desktop icon
    install -D lexaloffle-pico8.png "${_share}"/icons/${pkgname}.png
    
    # PATH symlink
    install -dm755 "${pkgdir}"/usr/bin/
    ln -s /opt/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
