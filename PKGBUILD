# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
_pkgname="sing-box"
pkgver="1.1.7"
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
sha512sums=('34243c22372fdfc82d8b9790c1dee8e4f5df964335301f4ce8bcfe056a5afedfa80894f118e947b47377ab4a27a365b3f3060515f516bea37f528ff1c9203421'
            '2e8ebec11151a0d4b0b764dd36f772a45ed8a1fc972b96649ab743c821bbea85876fcc4c092f2999369bb7e9590bfaff388de8a61c309dca68640fa4319c59fc'
            'ec1c5248cfee2c5dd7179f7148c5aec85e3814702a767686053a007a3baa94b917bd29df3a019d1602fedc45438f1808105a65abb4ea1f4665274ce394f6312e'
            'a3eb0e5789f04069fc7fd55ff09c437e394ae370110a43d6a1000759a524ac7d1b9f8b664656c2c9fb94fc9eca4852fb338a24186d9e3da30aed02773edbab86')
sha512sums_x86_64=('ffe1358ffe142bd6c1b6653b3440edd020d2b27130a4b05854e0ab8862fc723b5bdad34c9c0df0ba8bc727ee2984cae048130109144bfc92d7281eca10fcaaab')
sha512sums_armv7h=('f2b2ab81e9dee13cb39b174784755015a2a4e8871ab26627dac8f7f963db6a305e52a3defb28dd448eb6688aede0778c8f7eb61641f982790632f82892ff8564')
sha512sums_aarch64=('7e124ce53cedc41638f983e35cb888c858546d5c3cd54c7e59a9c90aecf5b32b64406e69d4a17c07c2bca663b05967930b63a3fcec26dda72b6b88edb0cef4d6')

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
