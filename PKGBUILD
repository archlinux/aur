# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
_pkgname="sing-box"
pkgver="1.1.7"
pkgrel="2"
pkgdesc="The universal proxy platform."
provides=("sing-box")
conflicts=("sing-box" "sing-box-beta" "sing-box-git")
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/SagerNet/sing-box"
license=("GPL3")
optdepends=("sing-geosite: sing-geosite database"
            "sing-geoip: sing-geoip database")
backup=("etc/${_pkgname}/config.json")
install="${pkgname}.install"
source=("${_pkgname}.service"
        "${_pkgname}@.service"
        "${_pkgname}.sysusers"
        "${install}"
        "config.json")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-armv7.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.tar.gz")
sha512sums=('381066a100ba637c6768f8df3fc4fbde995b17a11e0f3645b02d78f681af82aa8c27e96d41ae45d4407c8e63756b4560277212f6598fe67fd1c79af1da31e72a'
            '08aecc2a310996b3afc25a62beeea26b39f68b82c5a3bc17e498d32a270c9eb3142632fae0a26e58347bbb37dc7e2378e8c40916d7b75f4bf1170cbefef5b055'
            '8ec720c3f9cc1bd5ec2ad118dd3d1c27d86f39062e8d623713c4d841d7cf42e9b3b1552dbe9d66a90737cbece36a3e20cd568b82cd34f3faf82a745a5e59a680'
            'a45293245af386c833f54d27e7dc04416541157c6f26ade4750bdb97ec75d4cbca77db87ccaccae0bd09a9716f84dd502256e7d42261c2adb4ce79afb80b0409'
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
    install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "config.json" -t "${pkgdir}/etc/${_pkgname}"

    cd "${_pkgname}-${pkgver}-linux-${ARCH_MAP[${CARCH}]}"
    install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
