# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=metatube-server
pkgname="${_pkgname}-bin"
pkgver=1.2.9
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
sha256sums_i686=('e8befd24c68b2410a5b04c5b7e2ff256e24157ee445750256509db51be9de575')
sha256sums_x86_64=('62203ec790831b464b83ffc9a45bdcc30a9e5a63181d7550c80bb4fdf091e0a5'
                   '5f9d861171de9d30880b31b07f5c96060518966e063df36bb5980639373880a9')
sha256sums_aarch64=('22de25c5f4ce8d10871aa7b3d2e0ccd2fcda8acf4ad6f0723a00e5eb688f23af')
sha256sums_armv7h=('6d54ac51da55bd71ca37f02e9540072a451aa3eff62cee59e306fea8092dd4f4')
sha256sums_ppc64le=('a56f5fd92687f69d6292abfc7040bc4cc8b7ac0cb55c274ea38ce52a5c77fb60')
sha256sums_s390x=('b94a8e657e0de073cd49384d077d3018b4948c317f8398320a8656ac5574d9d6')
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
