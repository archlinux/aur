# Maintainer: Hans-Nikolai Viessmann <hv15 @ hw.ac.uk>
_pkgname=ocr-a
pkgname=latex-${_pkgname}-font
pkgver=1.00
pkgrel=1
pkgdesc="Provides Type 1 fonts of the OCR-A typeface."
arch=('any')
url="http://www.ctan.org/tex-archive/fonts/ocr-a/"
license=('custom:CTAN-NoSell')
depends=('texlive-core')
install="${pkgname}.install"
source=("http://mirrors.ctan.org/fonts/${_pkgname}.zip"
        "LICENSE::http://texcatalogue.ctan.org/licenses.nosell.html")
md5sums=('67ce5623c064cda47dbd349a351c1a4a'
         '6511a45b4d21ddf87726c16caf8e8ef4')

prepare() {
	cd "$_pkgname"

    # We need to fix a distribution-related problem
    sed 's/input ocra/input ocr-a/' -i ocr10.mf ocr12.mf ocr16.mf
}

package() {
    install -d ${pkgdir}/usr/share/texmf/fonts/source/public
    cp -r ${_pkgname} ${pkgdir}/usr/share/texmf/fonts/source/public/

    # lets not forget the license
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
