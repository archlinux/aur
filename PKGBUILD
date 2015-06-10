# Maintainer: Christoph Drexler <chrdr at gmx dot at>
# Contributor: hdh <hieu.d.hoang@gmail.com>

pkgname=otf-adf
pkgver=20150406
pkgrel=2
pkgdesc="Open Type Fonts released by Arkandis Digital Foundry"
arch=('any')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('custom:GPL with font exception')
groups=('adf-fonts')
depends=('fontconfig' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=otf.install
source=(
http://arkandis.tuxfamily.org/fonts/Accanthis-Std-20101124.zip
http://arkandis.tuxfamily.org/fonts/AurelisNo2-Std-20110311.zip
http://arkandis.tuxfamily.org/fonts/Baskervald-Std-20150322.zip
http://arkandis.tuxfamily.org/fonts/Berenis-Pro-20150322.zip
http://arkandis.tuxfamily.org/fonts/Electrum-Exp-20100711.zip
http://arkandis.tuxfamily.org/fonts/Gillius-Collection-20110312.zip
http://arkandis.tuxfamily.org/fonts/Ikarius-Serie-20111024.zip
http://arkandis.tuxfamily.org/fonts/Irianis-Std-20100729.zip
http://arkandis.tuxfamily.org/fonts/Libris-Std-20110117.zip
http://arkandis.tuxfamily.org/fonts/Mekanus-Std-20111025.zip
http://arkandis.tuxfamily.org/fonts/NeoGothis-Std-20150405.tar.gz
http://arkandis.tuxfamily.org/fonts/Oldania-Std-20150406.tar.gz
http://arkandis.tuxfamily.org/fonts/Romande-Collection-20110730.zip
http://arkandis.tuxfamily.org/fonts/Solothurn-Std-20111228.zip
http://arkandis.tuxfamily.org/fonts/Tribun-Std-20120228.zip
http://arkandis.tuxfamily.org/fonts/Universalis-Std-20110904.zip
http://arkandis.tuxfamily.org/fonts/OrnementsADF.zip
http://arkandis.tuxfamily.org/fonts/SymbolADF.zip
http://arkandis.tuxfamily.org/fonts/Keypad-20101223.zip
)

sha256sums=('49ba4bfe704187169c5782b0f309865d1fe63b1328090326e70f11ff3f25821d'
            '2fc8476894e7a443960f90d0e50b2f26f4b211b95de53f07874ca6cf7b5eb1ec'
            '5396f25cce3ea36b5ed2e3252a58858da95624361a4ba1fe53876a5f531a4724'
            'f82cbb563b616385a5d922462663f308b3dc4dfd280a670ab2221b7b940620aa'
            'ab7053d7fec89e34c190852073ba212e133858df007beb14ed68199efd32a858'
            'a74f1c9ecbdeb4751ac410f77dbe7210379dc87300c7a3afa19dcc354513f0bd'
            '1b9f84d482d0140cebe01d7d7874e18e0c51049511ce4ddf71139a8d8806bc40'
            '5a252bf7fbfca67aa421798f2fbe48c2f5d46208330633499553b308ef6d3bf2'
            '64aec9785be5a9a22476f8ab84f5a25d11807f52d8fb6e0badd215128c8b1097'
            '4ee5671b78b7f0c9b3d291971cb45dfa6812ba758e395da55cc617e1ea88a2a7'
            '5d34da283bf348862fc8094871097789287244b20b5d673553a659a0a84ca81e'
            '2fdf0e56e8f3a9408325bf9f904f36b561ce35b10d4eb35c1f0ef3f69c867af2'
            '724a625e30f4317af5dc7b3e99a5de8128c23e025f83bd48977fa4dcb03ad35c'
            '10bd7c07d78b9f37f4ef43f703541b9383fe0acfd636a763e9c20c0c559bbb4f'
            'c7860e371a1f8b04bc9c7eb5d1e4fae0fddb4cc4cb0565db30db205db464a840'
            'a084f5ee421d9c7aff53ff424b8df8108a6b49f93e1b0bed0f29730ce9ace889'
            '97a4a5f71db57e80fa5edb73c27d736c9b5c4de972b5bc072bba5854d27fa571'
            '4d8b7e7af9e3fa8149398f515d564200161fa3ca33423dee3b1e6b90d030e780'
            '6fa99e657ed717dd32a6457bd5fab189dfb90d2a10aa5a454e609eb879978467')

build() {
    # nothing to do
    true
}

package() {
    install -d "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm644 "${srcdir}"/*/*.[Oo][Tt][Ff]                "${pkgdir}"/usr/share/fonts/OTF/
    install -Dm644 "${srcdir}"/*/[Oo][Tt][Ff]/*.[Oo][Tt][Ff]   "${pkgdir}"/usr/share/fonts/OTF/
    install -Dm644 "${srcdir}"/*/*/[Oo][Tt][Ff]/*.[Oo][Tt][Ff] "${pkgdir}"/usr/share/fonts/OTF/

    install -Dm644 "${srcdir}"/Accanthis*/NOTICE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
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
    cat "${srcdir}"/${font}*/COPYING >> "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
