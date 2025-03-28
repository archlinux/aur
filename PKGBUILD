# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=metatube-server
pkgname="${_pkgname}-bin"
pkgver=1.2.11
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
sha256sums_i686=('205f323779503ca60b0327292fa8c29de83286bd117b691f5c99cdb6a00eab78')
sha256sums_x86_64=('86bb0aaccc2c3027ebd13dff122fb7fc92decbb0c5c532c159e48511a6e2aa17'
                   '3684fdc4c877b78d933d2e236283e16d5cce705222c28189b5a62307c8735afc')
sha256sums_aarch64=('2fbc477692a84d0744edd2eb0c4f3df954dcbd6115689edc96addb41189f05ff')
sha256sums_armv7h=('fe0017d7da75ee50f4b8e57df488e4d205dc68a705b142d8e7f131c35a3ece0f')
sha256sums_ppc64le=('748a773d16f232960edcb642ff89e20b7c52a45d991e72b9456958280e4a4321')
sha256sums_s390x=('8fe73435c99234aa7313c57314dcb6f98d507efd368544fa2f521a5ae69cca70')
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
