# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=discord-game-sdk
pkgver=2.5.6
pkgrel=1
pkgdesc='Discord Game SDK'
arch=('x86_64')
url='https://discord.com/developers/docs/game-sdk/sdk-starter-guide'
license=('custom')
depends=('gcc-libs')
options=('!strip')
source=("${pkgname}-${pkgver}.zip"::"https://dl-game-sdk.discordapp.net/${pkgver}/${pkgname//-/_}.zip"
        'POLICY'
        'STORE-DISTRIBUTION-AGREEMENT'
        'TERMS-OF-SERVICE')
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=('426eb5fa70647d884f461c63825b63668349efb4bc68a16e70bc4a24e119b92e'
            '2de103f28da9f8d12e90241e417adbaab4bc623db9b4c1f0b0a29195e4aaf49a'
            '6632e0756861cb8d334c2e63178963b2f96db1cfb80280eabfb0398afa9c4268'
            '12ba0226f989bc4dbb77b8cc8379787d43cfd06c9ff15933ef5653ef6b1b7ebe')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    bsdtar -xf "${pkgname}-${pkgver}.zip" -C "${pkgname}-${pkgver}"
}

package() {
    install -d -m755 "${pkgdir}/usr/src"
    install -D -m755 "${pkgname}-${pkgver}/lib/${CARCH}/${pkgname//-/_}.so" "${pkgdir}/usr/lib/lib${pkgname//-/_}.so"
    install -D -m644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 {POLICY,STORE-DISTRIBUTION-AGREEMENT,TERMS-OF-SERVICE} -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -dr --no-preserve='ownership' "${pkgname}-${pkgver}/c" "${pkgdir}/usr/include"
    cp -dr --no-preserve='ownership' "${pkgname}-${pkgver}/cpp" "${pkgdir}/usr/src/${pkgname}"
}
