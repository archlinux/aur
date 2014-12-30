# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

pkgname=calculix-doc
pkgver=2.7
pkgrel=2
pkgdesc="CalculiX: 3D finite element solver and post-processor (documentation and examples)"
arch=('any')
options=(docs !strip)
url="http://www.calculix.de/"
license=('GPL2')
depends=('calculix' )

source=("http://www.dhondt.de/ccx_${pkgver}.htm.tar.bz2"
        "http://www.dhondt.de/cgx_${pkgver}.htm.tar.bz2"
        "http://www.dhondt.de/cgx_${pkgver}.exa.tar.bz2")

sha256sums=('49bce119d5ae6247daddef78d7612c9c28e38b1cf998e4082d99007cb6f7d93c'
            '6468a330520dba5592e197f6d94511166a1d6835294a23b62c86015db4135170'
            '3a21e739e1d24ef1096c0bcd86cfcdeee59b2bf944da09085d0ee8f835b9deda')

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
