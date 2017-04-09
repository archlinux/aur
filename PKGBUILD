# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

_app_name='mooltipass'
_extension_id='cdifokahonpfaoldibbjmbkdhhelblpj'
_store_base_url='https://clients2.google.com/service/update2/crx?response=redirect&prodversion=49.0&x=id%3D'
pkgname="chromium-app-${_app_name}"
pkgver=2.0.69
pkgrel=1
pkgdesc='Mooltipass password manager client'
license=('custom:MIT')
arch=('any')
url='https://www.themooltipass.com/setup'
depends=('chromium')
_app_filename="${_app_name}-${pkgver}-${pkgrel}-app.crx"
source=("${_app_filename}::${_store_base_url}${_extension_id}%26installsource%3Dondemand%26uc"
        "${_extension_id}.json"
        'LICENSE')
sha256sums=('ee1bc1ed7067f76ad2b5cc3dfca267777f030594fd3bf4c32814b830fe8570ce'
            '9dd747f0f4b91fd25b9de43b48f42475d62591b34e90aca9ec87b078d4e315a9'
            '2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866')
noextract=("${_app_name}-app.crx")

prepare() {
    sed -i "s/\/usr\/lib\/x86_64-linux-gnu/\/usr\/lib\/${CARCH}-linux-gnu/" "${_extension_id}.json"
}

package() {
    cd "${srcdir}"

    install -Dm 644 "${_app_filename}"      \
            "${pkgdir}/usr/lib/${CARCH}-linux-gnu/${_app_name}-app-chromium/${_app_name}-app.crx"
    install -Dm 644 "${_extension_id}.json"     \
            "${pkgdir}/usr/share/chromium/extensions/${_extension_id}.json"

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
