# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname=sing-box-bin
_pkgname=sing-box
pkgver=1.1.5
pkgrel=1
pkgdesc="The universal proxy platform."
provides=("sing-box")
conflicts=("sing-box" "sing-box-beta" "sing-box-git")
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/SagerNet/sing-box"
license=("GPL3")
backup=("etc/${_pkgname}/config.json")
source=("sing-box.service"
        "config.json")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-armv7.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.tar.gz")
sha512sums=('8401816280aadf29cf7573aa811c36bb04e88cdf77983c48beb473ec46755a1defbf9c1bf270571a1e24a33a13678bb8a67dafd7eb207b65df5447ebcac0fdab'
            '5c2571270d448f664a37751382ccede549448bc49dc2ef4fa27ffda4c8c0c9f63df01f9c97b4e095661359dc205711d4efca189cea2e47842e68f1b2dc2bc42f')
sha512sums_x86_64=('f078d2a08c54cb1fca4dfae73e12ec02aba7ac99c29d624500820d158416e836873831dc99a66e792f786fa45914b0f6d967829997850335f28e142df3efd83d')
sha512sums_armv7h=('b134a95e31f4ebc733e3582d812b1e87cb0d5052279e190083ecece2b298650b0c28770d85ad41954b361cf65c350c94f46c8f04f991e6b1c3b953e335004874')
sha512sums_aarch64=('8abcdf7e46fc321b459a9669f8128d61b90ba531be68a0ddde0ec65375cd09e9863917f3159456dac9dfe8977a4dee4b77d11f95b2c3020a115f2db664d7239c')

package() {
    declare -A ARCH_MAP
    ARCH_MAP=( [x86_64]="amd64" [armv7h]="armv7" [aarch64]="arm64" )

    cd "${srcdir}"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "config.json" "${pkgdir}/etc/${_pkgname}/config.json"
    cd "${_pkgname}-${pkgver}-linux-${ARCH_MAP[${CARCH}]}"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
