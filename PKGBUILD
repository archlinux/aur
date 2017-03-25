# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

_app_name='mooltipass'
_extension_id='cdifokahonpfaoldibbjmbkdhhelblpj'
_store_base_url='https://clients2.google.com/service/update2/crx?response=redirect&prodversion=49.0&x=id%3D'
pkgname="chromium-app-${_app_name}"
pkgver=2.0.67
pkgrel=1
pkgdesc='Mooltipass password manager client'
license=('custom:MIT')
arch=('any')
url='https://www.themooltipass.com/setup'
depends=('chromium')
source=("${_app_name}-app.crx::${_store_base_url}${_extension_id}%26installsource%3Dondemand%26uc"
        "${_extension_id}.json"
        'LICENSE')
sha256sums=('a446b103246d0c009e5b57a820b796474a8af0141bdd4244aba71d309e7a76a1'
            'f29b6df7ea9f6ce4f0957a506a2d6dde169510328e0efcb48326f32e113a6f7d'
            '2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866')
noextract=("${_app_name}-app.crx")

prepare() {
    sed -i "s/\/usr\/lib\/x86_64-linux-gnu/\/usr\/lib\/${CARCH}-linux-gnu/" "${_extension_id}.json"
}

package() {
    cd "${srcdir}"

    install -Dm 644 "${_app_name}-app.crx"      \
            "${pkgdir}/usr/lib/${CARCH}-linux-gnu/${_app_name}-app-chromium/${_app_name}-app.crx"
    install -Dm 644 "${_extension_id}.json"     \
            "${pkgdir}/usr/share/chromium/extensions/${_extension_id}.json"

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
