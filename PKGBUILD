# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

_extension_name='mooltipass'
_extension_id='ffemldjbbfhimggdkkckolidemlllklk'
_store_base_url='https://clients2.google.com/service/update2/crx?response=redirect&prodversion=49.0&x=id%3D'
pkgname="chromium-extension-${_extension_name}"
pkgver=1.3.6
pkgrel=2
pkgdesc='Retrieve and store Mooltipass credentials easily from websites.'
license=('custom:MIT')
arch=('any')
url='https://www.themooltipass.com/setup'
depends=('chromium')
source=("${_extension_name}-${pkgver}-${pkgrel}.crx::${_store_base_url}${_extension_id}%26installsource%3Dondemand%26uc"
        "${_extension_id}.json"
        'LICENSE')
sha256sums=('14f1b742b61d414c451554e13e25516e03c51d2ab09e09352d9cff5e5e2c604f'
            'c247c66fbbfbed778ee20d0c7bc670e4cf6418122e154dde39928e45b752d4fd'
            '2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866')
noextract=("${_extension_name}.crx")

prepare() {
    sed -i "s/\/usr\/lib\/x86_64-linux-gnu/\/usr\/lib\/${CARCH}-linux-gnu/" "${_extension_id}.json"
}

package() {
    cd "${srcdir}"

    install -Dm 644 "${_extension_name}-${pkgver}-${pkgrel}.crx"    \
            "${pkgdir}/usr/lib/${CARCH}-linux-gnu/${_extension_name}-chromium/${_extension_name}.crx"

    install -Dm 644 "${_extension_id}.json"     \
            "${pkgdir}/usr/share/chromium/extensions/${_extension_id}.json"

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
