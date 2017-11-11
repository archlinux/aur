# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

_extension_name='mooltipass'
_extension_id='ffemldjbbfhimggdkkckolidemlllklk'
_store_base_url='https://clients2.google.com/service/update2/crx?response=redirect&prodversion=49.0&x=id%3D'
pkgname="chromium-extension-${_extension_name}"
pkgver=1.3.8
pkgrel=1
pkgdesc='Retrieve and store Mooltipass credentials easily from websites.'
license=('custom:MIT')
arch=('any')
url='https://www.themooltipass.com/setup'
depends=('chromium')
source=("${_extension_name}-${pkgver}-${pkgrel}.crx::${_store_base_url}${_extension_id}%26installsource%3Dondemand%26uc"
        "${_extension_id}.json"
        'LICENSE')
sha256sums=('ff5e5cfeb1d0b6c704eecee44daaf221b58e1c72f6f11d5108f810dfc79daff7'
            '9f7191ac559f1e6d9719747fade98fe23142cd4e2139e3a4589e502d7e3c35e3'
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
