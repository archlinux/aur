# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=metatube-server
pkgname="${_pkgname}-bin"
pkgver=1.3.0
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
sha256sums_i686=('fba3d24cb199d09fd2b30da786a0478782a25845a623f297bbd5947433cf1132')
sha256sums_x86_64=('c5b07d5d6969d0a6c492f9f23850c2b6a9eeec20385ea0eccac24308c6dadd52'
                   '36d65de764248b55ab17cc9074fb6d2c6b7a2da9316d744976f3baf505493011')
sha256sums_aarch64=('6cdee333f0f8db3c935ebc67e3232536920ef2a43b612139c16b86bea768c73d')
sha256sums_armv7h=('e1893fc6de85f9c1f95af0b37e8fe57373471168d3a6bc589a36a7fcd1e246f2')
sha256sums_ppc64le=('7a4563e6fb317c42cb470ea53910003a322bc6ba6f841b89ecf793214a009023')
sha256sums_s390x=('fb8268487f64245f793d072944ddfd027a962e073bda8e40de5f1e10b86b1ea2')
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
