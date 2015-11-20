# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

pkgname=calculix-doc
pkgver=2.9
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

sha256sums=('2313229b854e2558524d521ff586df05947416f0ee31a6b15edc59334e65178d'
            'f8f4585275902f99e785be3d7beb4b4eaeecea3ab2c4456114a5a715c9fec032'
            '7553005a384faadb702c3fc186fc48b26559ba1a52ecd662579990167514f6ec')

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
