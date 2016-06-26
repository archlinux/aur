# Contributor: orumin <dev@orum.in>

pkgname=adobe-base-14-fonts
pkgver=3.01
pkgrel=1
pkgdesc="Adobe base 14 fonts (Type1)"
url="ftp://ftp://ftp.adobe.com/pub/adobe/acrobatreader/unix/3.x/"
license=('custom')
arch=('any')
makedepends=('t1utils')
install=ttf.install
source=("ftp://ftp.adobe.com/pub/adobe/acrobatreader/unix/3.x/acroread_linux_301.tar.gz")
md5sums=('3c168eab471aef91f1436c57ba7963b2')

build() {
    cd "${srcdir}"
    tar -pxf READ.TAR

    cd Fonts
    t1binary Courier               pcrr8a.pfb
    t1binary Courier-Bold          pcrb8a.pfb
    t1binary Courier-BoldOblique   pcrbo8a.pfb
    t1binary Courier-Oblique       pcrro8a.pfb
    t1binary Helvetica             phvr8a.pfb
    t1binary Helvetica-Bold        phvb8a.pfb
    t1binary Helvetica-BoldOblique phvbo8a.pfb
    t1binary Helvetica-Oblique     phvro8a.pfb
    t1binary Symbol                psyr.pfb
    t1binary Times-Bold            ptmb8a.pfb
    t1binary Times-BoldItalic      ptmbi8a.pfb
    t1binary Times-Italic          ptmri8a.pfb
    t1binary Times-Roman           ptmr8a.pfb
    t1binary ZapfDingbats          pzdr.pfb

    find . -iname '*.pfb' -exec type1afm {} \;
}

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/share/fonts/Type1/"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm644 LICREAD.TXT "${pkgdir}/usr/share/licenses/${pkgname}/"

    cd Fonts
    find . -iname '*.pfb' -exec install -Dm644 {} "${pkgdir}/usr/share/fonts/Type1/"{} \;
    find . -iname '*.afm' -exec install -Dm644 {} "${pkgdir}/usr/share/fonts/Type1/"{} \;
}
