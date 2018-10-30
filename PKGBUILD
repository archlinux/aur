# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
_pkgname=ocr-a
pkgname=latex-${_pkgname}-font
pkgver=1.00
pkgrel=2
pkgdesc="Provides Type 1 fonts of the OCR-A typeface."
arch=('any')
url="http://www.ctan.org/tex-archive/fonts/ocr-a/"
license=('custom:CTAN-NoSell')
depends=('texlive-core')
install="${pkgname}.install"
source=("http://mirrors.ctan.org/fonts/${_pkgname}.zip"
        'LICENSE')
md5sums=('67ce5623c064cda47dbd349a351c1a4a'
         'cbf1958ac437a0e32e4a517c9a3a5e11')

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
