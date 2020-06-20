# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=ti-pru-cgt
pkgver=2.3.3
pkgrel=1
pkgdesc='PRU code generation tools'
arch=('i686' 'x86_64' 'armv7h')
url='hhttps://www.ti.com/tool/PRU-CGT'
license=('custom')

source_i686=(
    "https://downloads.ti.com/codegen/esd/cgt_public_sw/PRU/${pkgver}/ti_cgt_pru_${pkgver}_linux_installer_x86.bin"
)
md5sums_i686=(
    'abb76fac986993aafaf467915985ec4f'
)

source_x86_64=(
    "https://downloads.ti.com/codegen/esd/cgt_public_sw/PRU/${pkgver}/ti_cgt_pru_${pkgver}_linux_installer_x86.bin"
)
md5sums_x86_64=(
    'abb76fac986993aafaf467915985ec4f'
)

source_armv7h=(
    "https://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${pkgver}/ti_cgt_pru_${pkgver}_armlinuxa8hf_busybox_installer.sh"
)
md5sums_armv7h=(
    '648a6d7d8162fd6a89f381c7b974e6b0'
)

prepare() {
    cd "${srcdir}"

    if [[ "${CARCH}" == 'armv7h' ]]; then
        chmod +x "ti_cgt_pru_${pkgver}_armlinuxa8hf_busybox_installer.sh"
    else
        chmod +x "ti_cgt_pru_${pkgver}_linux_installer_x86.bin"
    fi
}

package() {
    local installdir="${pkgdir}/opt/${pkgname}"
    mkdir -p "${installdir}"

    cd "${srcdir}"

    if [[ "${CARCH}" == 'armv7h' ]]; then
        "./ti_cgt_pru_${pkgver}_armlinuxa8hf_busybox_installer.sh" --prefix "${installdir}" --temp '/tmp'
    else
        printf "${installdir}\n" | "./ti_cgt_pru_${pkgver}_linux_installer_x86.bin" --mode text
        find "${installdir}" -maxdepth 1 -type f -delete
    fi
}
