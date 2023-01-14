# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname=sing-box-bin
_pkgname=sing-box
pkgver=1.1.4
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
sha512sums_x86_64=('9046d76368c6d3cf16a794eda3259e82237747cc17e35d40eeaaf51a39779c2f1671895b95f197481a2b216406d5519cc8b47b0ceb6f32167664ec11b7fc3472')
sha512sums_armv7h=('43dbe426165ce6b3a6fe2ea97b7f4ad2311487fa3a1d4e62fb5c3e15bc7b813cc2d20ba446e381f2c5f96772633d18ac393ecc22da1f7f4a3936cd3148bc61cc')
sha512sums_aarch64=('7296e79338c18b8b3e145a0fbbec34d7daba2f610a01416df0ee09ef223d4786af9793e3086989f66b6a39727f7b4abea5e927d3ee7d04a9c814f60cb6b409c3')

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
