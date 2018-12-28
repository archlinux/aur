# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

pkgname=calculix-doc
pkgver=2.15
pkgrel=1
pkgdesc="CalculiX: 3D finite element solver and post-processor (documentation and examples)"
arch=('any')
options=(docs !strip)
url="http://www.calculix.de/"
license=('GPL2')
depends=('calculix' )

source=("http://www.dhondt.de/ccx_${pkgver}.htm.tar.bz2"
        "http://www.dhondt.de/cgx_${pkgver}.htm.tar.bz2"
        "http://www.dhondt.de/cgx_${pkgver}.exa.tar.bz2")

sha256sums=('0bfdef36076d3d1d1b7f8cd1d5a886915f7b0b54ed5ae7a7f71fa813ef655922'
            'fd9bbb71175016e8e8c4b4e39479697cdcb9cf521c6fe518860f3cdb9fa33bc7'
            '10dbb18b1a52730d4a55d94eb1e9b10ccd3f3ce0a688814710d31c05cc798997')

prepare()
{
    cd "${srcdir}"
    find ${srcdir}/CalculiX/ -type f -exec chmod +644 '{}' \;
    find ${srcdir}/CalculiX/ -type d -exec chmod +755 '{}' \;
}

package() 
{
    msg "Copying files"

    install -Dm755 -d ${pkgdir}/usr/share/doc/ccx
    install -Dm755 -d ${pkgdir}/usr/share/doc/cgx/examples
    
    cp -dr --no-preserve=ownership ${srcdir}/CalculiX/cgx_${pkgver}/examples/* ${pkgdir}/usr/share/doc/cgx/examples
    cp -dr --no-preserve=ownership ${srcdir}/CalculiX/ccx_${pkgver}/doc/ccx/* ${pkgdir}/usr/share/doc/ccx
    cp -dr --no-preserve=ownership ${srcdir}/CalculiX/cgx_${pkgver}/doc/cgx/* ${pkgdir}/usr/share/doc/cgx

    msg2 "Done"  
}
