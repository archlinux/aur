# Maintainer: Edmund Lodewijks <e.lodewijks@gmail.com>

pkgname=samsung-m238x
pkgver=1.00.39
pkgrel=1
pkgdesc="Samsung M238x printer driver"
arch=('i686' 'x86_64')
url="http://www.samsung.com"
license=('LicenseRef-samsung')
depends=('cups' 'ghostscript')
conflicts=('samsung-unified-driver')
options=(!strip)
source=("https://downloadcenter.samsung.com/content/DR/201704/20170407143829533/uld_V${pkgver}_01.17.tar.gz")
sha256sums=('09c166f9b1e11ff312965886387ee31c6980867c67c3d6206680cbae76ae6746')

_arch=${CARCH/i686/i386}

prepare() {
    chmod -R u+w "$srcdir"/*
}

package() {
    cd "${srcdir}"

    install -Dm 644 "${srcdir}"/uld/$_arch/libscmssc.so "${pkgdir}"/usr/lib/libscmssc.so
    install -Dm 644 "$srcdir"/uld/$_arch/smfpnetdiscovery "$pkgdir"/usr/lib/cups/backend/smfpnetdiscovery
    install -Dm 644 "$srcdir"/uld/$_arch/pstosecps "$pkgdir"/usr/lib/cups/filter/pstosecps
    install -Dm 644 "$srcdir"/uld/$_arch/rastertospl "$pkgdir"/usr/lib/cups/filter/rastertospl
    ln -s rastertospl "${pkgdir}"/usr/lib/cups/filter/rastertosplc

    install -Dm 644 "$srcdir"/uld/noarch/share/ppd/Samsung_M283x_Series.ppd "$pkgdir"/usr/share/ppd/suld/Samsung_M283x_Series.ppd
    install -Dm 644 "$srcdir"/uld/noarch/share/ppd/cms/M283xsc.cts "$pkgdir"/usr/share/ppd/suld/cms/M283xsc.cts

    install -Dm 644 "$srcdir"/uld/noarch/license/eula.txt "$pkgdir"/usr/share/licenses/$pkgbase/LICENSE
}
