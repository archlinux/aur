# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

_app_name='mooltipass'
_extension_id='cdifokahonpfaoldibbjmbkdhhelblpj'
_store_base_url='https://clients2.google.com/service/update2/crx?response=redirect&prodversion=49.0&x=id%3D'
pkgname="chromium-app-${_app_name}"
pkgver=2.0.61
pkgrel=2
pkgdesc='Mooltipass password manager client'
license=('custom:MIT')
arch=('any')
url='https://www.themooltipass.com/setup'
depends=('chromium')
source=("${_app_name}-app.crx::${_store_base_url}${_extension_id}%26installsource%3Dondemand%26uc"
        "${_extension_id}.json"
        'LICENSE')
sha256sums=('3ac647c3aa0dd549d3f731fbd6d955466967503f673a996b627f12ae9dcc5019'
            '5930a63d2f1b6a1357ebe728d3492aaec4ec1b38c4dc5d3761f0c09370a0741b'
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
