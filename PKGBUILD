# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
_pkgname="sing-box"
pkgver="1.1.6"
pkgrel="1"
pkgdesc="The universal proxy platform."
provides=("sing-box")
conflicts=("sing-box" "sing-box-beta" "sing-box-git")
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/SagerNet/sing-box"
license=("GPL3")
backup=("etc/${_pkgname}/config.json")
install="${pkgname}.install"
source=("${_pkgname}.service"
        "${_pkgname}@.service"
        "${install}"
        "config.json")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-armv7.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.tar.gz")
sha512sums=('bc2082cd73fe8a5be15399afcf8aef6f614b75596ac0e6a73614b2cfe09c440e9ecefe0c5c99959c7b1ef7ad6b3fac74af690baf098dd0384067f4ad2c801ef2'
            '7361778f1f76b6c400d5617f2954086ca6611c955b8fc5a4f1a073a067ce340aefd30a40142dcd003ab1df7d4b428d81ae0e3593e8f949167f9886c3c7186fd8'
            'ec1c5248cfee2c5dd7179f7148c5aec85e3814702a767686053a007a3baa94b917bd29df3a019d1602fedc45438f1808105a65abb4ea1f4665274ce394f6312e'
            'a3eb0e5789f04069fc7fd55ff09c437e394ae370110a43d6a1000759a524ac7d1b9f8b664656c2c9fb94fc9eca4852fb338a24186d9e3da30aed02773edbab86')
sha512sums_x86_64=('7167b2208f96bcd5c8717e69c709e4baeb0daf0797aef34003455219e09dce0febf51974ee12ba8029a751fc0087f7131a31d13c798b66d2a531fdf557f1e0e9')
sha512sums_armv7h=('8c8bdb7001bd0c8c4381444c56d9844c4d00176c9aac6c5143661c8630cee801929f28bfcc9eabaf74b13b762a7de68922b62c8c81cf776198d211017aeb1792')
sha512sums_aarch64=('928a8c41f9c3c6c56bca7f44dabb3f01f2fa80363bfa78a31c66c7b210bf81f7fc904686d089b3bcc248565a41c2f4c293180d1cdf212c3fb6a9b20e8dda9dfa')

package() {
    declare -A ARCH_MAP
    ARCH_MAP=( [x86_64]="amd64" [armv7h]="armv7" [aarch64]="arm64" )

    cd "${srcdir}"
    install -Dm644 "${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${_pkgname}@.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "config.json" -t "${pkgdir}/etc/${_pkgname}"

    cd "${_pkgname}-${pkgver}-linux-${ARCH_MAP[${CARCH}]}"
    install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
