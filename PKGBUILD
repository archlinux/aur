# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

pkgname=calculix-doc
pkgver=2.14
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

sha256sums=('4e697b40e68c12a7b9e67516b59ec18ee4779ab1719c7582fc67d38a81ae8988'
            '280b5f76d3a6c61772fa50eeabca043b53d4083fcf186d1c80bfe5669398e6ea'
            '78dbd438b64e68af48cec0c34fd76ab79d11aa0c7fcceb7357cf107fb203c2da')

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
    
    cp -dr --no-preserve=ownership ${srcdir}/CalculiX/cgx_${pkgver}.1/examples/* ${pkgdir}/usr/share/doc/cgx/examples
    cp -dr --no-preserve=ownership ${srcdir}/CalculiX/ccx_${pkgver}/doc/ccx/* ${pkgdir}/usr/share/doc/ccx
    cp -dr --no-preserve=ownership ${srcdir}/CalculiX/cgx_${pkgver}.1/doc/cgx/* ${pkgdir}/usr/share/doc/cgx

    msg2 "Done"  
}
