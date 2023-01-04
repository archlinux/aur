# Maintainer: adityaphra <adityaphra@gmail.com>

pkgname=sing-box-bin
_pkgname=sing-box
pkgver=1.1.2
pkgrel=1
pkgdesc="The universal proxy platform."
provides=("sing-box")
conflicts=("sing-box" "sing-box-beta" "sing-box-git")
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/SagerNet/sing-box"
license=("GPL3")
source=("sing-box.service"
        "config.json")
sha512sums=("da1513df4776abde3120527c96a7931b4c9d161b50338494759dd3f350511fbc12eef38ad2c41cd7f32ac3b57801ebc22f128b155fbc93cf7075506fd609f41f"
        "5c2571270d448f664a37751382ccede549448bc49dc2ef4fa27ffda4c8c0c9f63df01f9c97b4e095661359dc205711d4efca189cea2e47842e68f1b2dc2bc42f")
sha512sums_x86_64=("f03a1677623b6ecc6eaf45b279acc291bf181577c9df7dc672424597a3f68e258700d7a2e693b45cf95387f5bed4c07ad56327c6e432d3e5effb420357ab18b1")
sha512sums_armv7h=("c00ef1e45eec800b727c1c481b8242e66761493b5e906cd3ee0c7977deac69940af0a8dfce083d0ef70ae80263bbb76c6b1f9d22dcd968c0bf6197a0f514a210")
sha512sums_aarch64=("98c5c839b4f586183caa1236951f1b4e6fc4bdb047a30b25dc5b9054fe2ed24cc9d120c4476d2e4a7804c496514228bd14cfd8603c2fc5b058571dd4843eb6ae")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-armv7.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.tar.gz")
backup=("etc/${_pkgname}/config.json")

package() {
    declare -A ARCH_MAP
    ARCH_MAP=( [x86_64]="amd64" [armv7h]="armv7" [aarch64]="arm64" )

    cd "${srcdir}"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "config.json" "${pkgdir}/etc/${_pkgname}/config.json"
    cd "${_pkgname}-${pkgver}-linux-${ARCH_MAP[${CARCH}]}"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
