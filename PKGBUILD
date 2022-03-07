# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Roger Braun <davinelulinvega@gmail.com>
# Based on work by: Lee.MaRS <leemars@gmail.com>
# Contributor: kevku <kevku@gmx.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=acroread-fonts-systemwide
epoch=1
_cloudver=DC
_ver=2021.011.20039
_fontpackver=2022.001.20085
_shortver=${_ver:2}
_nodotver=${_shortver//.}
_fpshortver=${_fontpackver:2}
_fpnodotver=${_fpshortver//.}
pkgver=${_cloudver}_${_ver}
pkgrel=1
pkgdesc="Fonts from Adobe Acrobat Reader ${_cloudver}"
arch=('any')
url="http://www.adobe.com/products/acrobat/acrrasianfontpack.html"
license=('custom')
makedepends=('p7zip')
conflicts=('ttf-adobe-fonts'
           'ttf-adobe-fonts-cjkext'
           'acroread-fonts'
           'acroread-font-chinese-simplified')
source=("http://ardownload.adobe.com/pub/adobe/reader/win/Acrobat${_cloudver}/${_nodotver}/AcroRdr${_cloudver}${_nodotver}_en_US.exe"
        "http://ardownload.adobe.com/pub/adobe/reader/win/Acrobat${_cloudver}/misc/FontPack${_fpnodotver}_XtdAlf_Lang_${_cloudver}.msi")
noextract=("AcroRdr${_cloudver}${_nodotver}_en_US.exe")
sha256sums=('9ea7854fc05fd9c92b070893c6b199fbef922e36304e85177503df6d1470cd62'
            '21664fb9d0c7440459579867fb54d3ac6b9c6472ad0ef573f234c7bc0a4f23d3')

prepare() {
  cd "$srcdir"

  7z -y -i!Data1.cab e AcroRdr${_cloudver}${_nodotver}_en_US.exe
  7z -y -i!*.otf e Data1.cab
  7z -y -i!license.html19 e Data1.cab
  7z -y -i\!*.o* e FontPack${_fpnodotver}_XtdAlf_Lang_${_cloudver}.msi
  mv adobedevanagari_bolditalic.o adobedevanagari_bolditalic.otf
}

package() {
  cd "$srcdir"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF"
  install -Dm644 license.html19 "$pkgdir/usr/share/licenses/$pkgname/license.html"
}
