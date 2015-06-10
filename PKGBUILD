# Maintainer: Christoph Drexler <chrdr at gmx dot at>
# Contributor: hdh <hieu.d.hoang@gmail.com>

pkgname=ttf-adf
pkgver=20110731
pkgrel=3
pkgdesc="True Type Fonts released by Arkandis Digital Foundry"
arch=('any')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('custom:GPL with font exception')
groups=('adf-fonts')
depends=('fontconfig' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=ttf.install
source=(
http://arkandis.tuxfamily.org/fonts/Irianis-Std-20100729.zip
http://arkandis.tuxfamily.org/fonts/Romande-Collection-20110730.zip
http://arkandis.tuxfamily.org/fonts/OrnementsADF.zip
http://arkandis.tuxfamily.org/fonts/SymbolADF.zip
)

sha256sums=('5a252bf7fbfca67aa421798f2fbe48c2f5d46208330633499553b308ef6d3bf2'
            '724a625e30f4317af5dc7b3e99a5de8128c23e025f83bd48977fa4dcb03ad35c'
            '97a4a5f71db57e80fa5edb73c27d736c9b5c4de972b5bc072bba5854d27fa571'
            '4d8b7e7af9e3fa8149398f515d564200161fa3ca33423dee3b1e6b90d030e780')

build() {
    # nothing to do
    true
}

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -Dm644 "${srcdir}"/*/[Tt][Tt][CcFf]/*.[Tt][Tt][CcFf]   "${pkgdir}"/usr/share/fonts/TTF/
    install -Dm644 "${srcdir}"/*/*/[Tt][Tt][CcFf]/*.[Tt][Tt][CcFf] "${pkgdir}"/usr/share/fonts/TTF/

    install -Dm644 "${srcdir}"/Irianis*/NOTICE.txt "${pkgdir}"/usr/share/licenses/ttf-adf/LICENSE
    for font in ${source[@]}; do
        font=$(basename $font)
        font=${font%.zip}
        font=${font%-*}
        font=${font/Symbol/Symbols}
        echo -ne "********************************************************************************\n\n" \
                                         >> "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        cat "${srcdir}"/${font}*/NOTICE* >> "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    done

    echo -ne "********************************************************************************\n\n" \
                                     >> "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cat "${srcdir}"/${font}*/TTF/COPYING >> "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
