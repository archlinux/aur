# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

pkgname=calculix-doc
pkgver=2.10
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

sha256sums=('dde1e53048b76832b4e9519838d4eba57559fd6fe204d03d4e54b7aef237c546'
            '92655f32b9909c09414509f4f05aa7ff049321b8b0bbdec884d9b1fde90ab0fa'
            '44f1155bc98f90447f22d39c5b3dfaf4a1a6def79a79e68e499b3ae4ee10b24c')

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
