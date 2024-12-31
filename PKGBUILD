# Maintainer: devome <evinedeng@hotmail.com>

pkgname=ddddocr-fastapi
pkgver=1.0.0
pkgrel=2
pkgdesc="A high-performance OCR API service based on FastAPI and ddddocr, offering features like text recognition from images, sliding captcha matching, and object detection."
arch=("any")
url="https://github.com/sml2h3/${pkgname}"
license=("MIT")
backup=("etc/conf.d/${pkgname}.conf")
depends=("python-ddddocr" "python-fastapi" "python-python-multipart" "uvicorn")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.conf"
        "${pkgname}.service"
        "${pkgname}-1.patch::https://github.com/sml2h3/ddddocr-fastapi/commit/abbd580b7ad2e0f9f975fbfd5c6abca878503f53.patch"
        "${pkgname}-2.patch::https://github.com/sml2h3/ddddocr-fastapi/commit/901103a7e37a7563ed85c96d36b3ca12ead8cf75.patch"
        "${pkgname}-3.patch::https://github.com/sml2h3/ddddocr-fastapi/commit/f9e3624eff1ed7c2a94811f3d95fe1846aec5b8e.patch"
        "${pkgname}-4.patch::https://github.com/sml2h3/ddddocr-fastapi/commit/579dbff2376b222ca63ed29ff818bef13acc5df0.patch"
        "${pkgname}-5.patch::https://github.com/sml2h3/ddddocr-fastapi/commit/dc22b9e823bc15a427790f38cf4b5bee5e3a8427.patch"
        "${pkgname}-6.patch::https://github.com/sml2h3/ddddocr-fastapi/commit/a40a6b96d7259c2f5cd544963d147cbd40be344d.patch")
sha256sums=('735e48c3c589491836617ff5cfcedacce68c832a8de7b734c51b358353cf05bc'
            '5a9f1360872090c3bb3ef136742fc3c046cfba84c46c73cb76a6e414c73ca77c'
            '12d6a3d9aeaabbbba0fafa08de5431b163d9cbcce3763b9557701c952f7871fa'
            'b9f4dc5f19abf44b1549d838fc520a52b7696ca9e10b4e77b0aa101982d2e174'
            '7630094b840e70bcd336e401e166912f62aed72a6091de619f806b40835f417d'
            '46644ad6578dd470a9f57143f9da7354136235c685f3753df073b8271e07af56'
            '3fa05a265266ae4e3e10f202f0a6215375308a070d19a3709f695f8445770885'
            'e88668c4cd3d282674acdc4772aa074515b949c13eb010344d4786538152c082'
            'd2a1fcf2fd554cb3a39730528cf56fde6155da21f39c133ac3c001b7c1cf12c6')

prepare() {
    cd "${pkgname}-${pkgver}"
    for _patch in ../"${pkgname}"-*.patch; do
        patch -Np1 < "$_patch"
    done 
}

package() {
    install -Dm644 "${pkgname}.conf"     "${pkgdir}/etc/conf.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    cd "${pkgname}-${pkgver}"
    install -Dm644 app/*.py           -t "${pkgdir}/usr/share/${pkgname}/app"
    install -Dm644 README.md             "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
