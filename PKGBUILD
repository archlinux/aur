# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

pkgname=calculix-doc
pkgver=2.20
pkgrel=2
pkgdesc="CalculiX: 3D Structural Finite Element Program - Docs and Examples"
arch=('any')
options=(docs !strip)
url="http://www.calculix.de/"
license=('GPL2')

source=("http://www.dhondt.de/ccx_${pkgver}.htm.tar.bz2"
        "http://www.dhondt.de/cgx_${pkgver}.htm.tar.bz2"
        "http://www.dhondt.de/cgx_${pkgver}.exa.tar.bz2")

sha256sums=('51a0922f5cecc9fbe5880afb47c3b24ef90300fb800b4d10fb02b297e7c2b4c1'
            '8eb979caa6d965a146e4b70bb288a07448e8de9d90b8c28b9a15030f4df80da0'
            '3fc8520ec934f916c554693ddf46ff750de0dbc91df37790bb590926d05d12d0')

prepare()
{
    cd "${srcdir}"
    find ${srcdir}/CalculiX/ -type f -exec chmod +644 '{}' \;
    find ${srcdir}/CalculiX/ -type d -exec chmod +755 '{}' \;
}

package() 
{
    install -Dm755 -d ${pkgdir}/usr/share/doc/ccx
    install -Dm755 -d ${pkgdir}/usr/share/doc/cgx/examples
    
    cp -dr --no-preserve=ownership ${srcdir}/CalculiX/cgx_${pkgver}/examples/* ${pkgdir}/usr/share/doc/cgx/examples
    cp -dr --no-preserve=ownership ${srcdir}/CalculiX/ccx_${pkgver}/doc/ccx/* ${pkgdir}/usr/share/doc/ccx
    cp -dr --no-preserve=ownership ${srcdir}/CalculiX/cgx_${pkgver}/doc/cgx/* ${pkgdir}/usr/share/doc/cgx
}
