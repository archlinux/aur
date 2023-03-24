# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
_pkgname="sing-box"
pkgver="1.2.0"
pkgrel="1"
pkgdesc="The universal proxy platform."
provides=("sing-box")
conflicts=("sing-box" "sing-box-beta" "sing-box-git")
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/SagerNet/sing-box"
license=("GPL3")
optdepends=("sing-geosite: sing-geosite database"
            "sing-geoip: sing-geoip database")
backup=("etc/${_pkgname}/config.json")
source=("${_pkgname}.service"
        "${_pkgname}@.service"
        "${_pkgname}.sysusers"
        "config.json")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-armv7.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.tar.gz")
sha512sums=('d6eaf407ccf6239f05bb5da0c962be8ef0855c18f5bf342d0721a54ee4246ba541a5a9481858daeb02491afe9dd1e7546477b4d6554c9111506a445034eacd02'
            '6cb7f8d44a06a2d61febf25813c536eb63e79142b0bbe1b964f232080df6cdc45a70c7ca6a5834cba23280684650a51ba6a5535a03664a49d18e518b394087dc'
            '8ec720c3f9cc1bd5ec2ad118dd3d1c27d86f39062e8d623713c4d841d7cf42e9b3b1552dbe9d66a90737cbece36a3e20cd568b82cd34f3faf82a745a5e59a680'
            'a3eb0e5789f04069fc7fd55ff09c437e394ae370110a43d6a1000759a524ac7d1b9f8b664656c2c9fb94fc9eca4852fb338a24186d9e3da30aed02773edbab86')
sha512sums_x86_64=('6fe60419d79592a648e5b7ce88f85d8bd6670c75aa23e43acdac85ee8cdcc84489f82f43751a0fd39bd075c63275ddf1c6d1441da7f2d730e5a2233f69b2e9a5')
sha512sums_armv7h=('88f92c94c743cd41b73817f936ce3f846fa8e0b3791203291a6ddd501603c5a9b4e25c1d2a65ea09e8f7c71dcfa967acd58c196c85ff5fe322ccedf441119ffe')
sha512sums_aarch64=('109631adfda5d2090b53ff5142ab98f678cba6c2b7881161ce48832340b9056ac147f12f2e9a52003d7fb1d39048ef4ecac1cc21daa44967c2126c1c2982c5ac')

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
