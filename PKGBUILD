# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=metatube-server
pkgname="${_pkgname}-bin"
pkgver=1.4.0
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
sha256sums_i686=('6bfdeed39b23ffc2251fb2282e0100120791e564d1c2d3af39f1d66d8482377a')
sha256sums_x86_64=('83f029a01bb506bec24e36a18e5343d670922540cf875bba5f106b27a523a4ea'
                   '81e0b7eb33900d90a7d54ac04e1f70f1191d872ced2344f3c1549e2d0948c0d9')
sha256sums_aarch64=('dccb33aa4ea85b26d513762e0b8e4691bf3fdc60c19f7d25dd96858f986684e6')
sha256sums_armv7h=('796c369040ad1bca25318e21be457c0ecc6fbb07dbc89ed77d0701814ba08a7a')
sha256sums_ppc64le=('9289bc2b860f67ae9c8a52c4197f857dbbfbf9114dbf30b338dc46d4840ad507')
sha256sums_s390x=('6e627af84f5409183f133fd0e27a1bc7ed887add9a6224d72ceb038357b4ec3d')
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
