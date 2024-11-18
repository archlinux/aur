# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=metatube-server
pkgname="${_pkgname}-bin"
pkgver=1.2.8
pkgrel=1
pkgdesc="MetaTube Server"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'ppc64le' 's390x')
url="https://github.com/metatube-community/${_pkgname}-releases"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=("Unknown")
backup=("etc/conf.d/${_pkgname}.env")
optdepends=("postgresql: PostgresSQL database engine")
source=("${_pkgname}.env"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
source_i686=("${_pkgname}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-386.zip")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.zip"
               "${_pkgname}-${pkgver}-x86_64-v3.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-v3.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-armv7.zip")
source_ppc64le=("${_pkgname}-${pkgver}-ppc64le.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-ppc64le.zip")
source_s390x=("${_pkgname}-${pkgver}-s390x.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-s390x.zip")
sha256sums=('b607c8fd8f92c19d549969e5ec9b35c60bc42a2797e1bd233d58819dea1c3cfa'
            'cf7f3035a723e4307185562bc845deb051d7cea804531b72b044c3b78860cc55'
            'afb0c09c4b7ade9ac23018452a1da49d7e8f7e45adb83e4bc073ef1f9d363a76'
            '641a2a92fc01b04679b02fba1101bee991f627fc795b18a5c46ff970d17fe0da')
sha256sums_i686=('74c685d64084834bf02a8181cbb55ff13998d9c9c33f1012c0cd3376472f050e')
sha256sums_x86_64=('9ac51c24a0f5a86da83294b7c5e4c37f14f96b5f6d9837c1496928a152f6959d'
                   '79053a9216e512620002d3d6deae73dc5d3eb40af8eba5ebb5ef1c06f513af51')
sha256sums_aarch64=('5a46782212675e21fa4f60efd94134ebe335a3742b3f181623246238a2ae8206')
sha256sums_armv7h=('7874e33d33be2f06fd2c120cb865d9e76b4b53a38b57ddd9fe8153a01d66ca49')
sha256sums_ppc64le=('283fa8e1118270cc4c28277794e8d8e202f23e61f89e6848cdeb35d43bc52a57')
sha256sums_s390x=('fedcdbc0392b24b502b691ee1f33278392da8080381120b508ad537a43ab236c')
noextract=("${_pkgname}-${pkgver}"-x86_64{,-v3}.zip)

prepare() {
    if [[ $CARCH == x86_64 ]]; then
        if grep -q avx2 /proc/cpuinfo; then
            bsdtar -xf "${_pkgname}-${pkgver}-${CARCH}-v3".zip
        else
            bsdtar -xf "${_pkgname}-${pkgver}-${CARCH}".zip
        fi
    fi
}

package() {
    install -Dm755 "${_pkgname}-linux"-*  "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.env"      "${pkgdir}/etc/conf.d/${_pkgname}.env"
    install -Dm644 "${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
