# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgbase=xuantie-900-llvm-toolchain-bin
_platform_linux_ver1=linux-6.6.0
pkgname=(
    $pkgbase
    xuantie-900-llvm-elf-newlib-bin
    xuantie-900-llvm-${_platform_linux_ver1}-glibc-bin
    xuantie-900-llvm-manual
)
pkgver=2.1.0
pkgrel=1
arch=('x86_64')
url=https://www.xrvm.cn/community/download?id=4453625117213265920
license=('unknown')
_dwurl=https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/
source=(
    "xuantie-900-llvm-elf-newlib-bin-${pkgver}.tar.gz::${_dwurl}/1749717040975/Xuantie-900-llvm-elf-newlib-${arch}-V${pkgver}-20250522.tar.gz"
    "xuantie-900-llvm-${_platform_linux_ver1}-glibc-bin-${pkgver}.tar.gz::${_dwurl}/1749717539068/Xuantie-900-llvm-${_platform_linux_ver1}-glibc-${arch}-V${pkgver}-20250522.tar.gz"
    # Documentation
    "ReleaseNote ${pkgver}.pdf::${_dwurl}/1749715591203/ReleaseNote.pdf"
    "XuanTieCustomExtensionV0.9.0 ${pkgver}.pdf::${_dwurl}/1750149606783/XuanTieCustomExtensionV0.9.0.pdf"
)

sha256sums=('fd816ec367cf70c35338c47cf071bf8a5d1467bdf2e1d21aa736b209ef4cff4e'
            'ddbb415d91518ec6480b1bf75db0f427ba72a5d0a69db68453f6470576c0ea34'
            '7ca9d4d042acff682e660bfe9440e5610c21df7621273eeb1a38c185da630eb4'
            '6814ddaf4c7e016dc7fe5b228bc2299b99a04425ee1d3970060c51f4b9fe3400')

noextract=(
    xuantie-900-llvm-elf-newlib-bin-${pkgver}.tar.gz
    xuantie-900-llvm-${_platform_linux_ver1}-glibc-bin-${pkgver}.tar.gz
)
options=('!strip')
_toolchain_name="xuantie-900-llvm"

package_xuantie-900-llvm-toolchain-bin() {
    pkgdesc="Xuantie 900 LLVM toolchain"
    depends=(
        xuantie-900-llvm-elf-newlib-bin
        xuantie-900-llvm-${_platform_linux_ver1}-glibc-bin
        xuantie-900-llvm-manual
    )
}

package_xuantie-900-llvm-elf-newlib-bin() {
    pkgdesc="Xuantie 900 LLVM elf newlib toolchain"
    install -dm0755 "${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin}" --no-same-owner --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/${_toolchain_name}/${pkgname%-bin}/bin ] && append_path '/opt/${_toolchain_name}/${pkgname%-bin}/bin'

export PATH
EOF
}

package_xuantie-900-llvm-linux-6.6.0-glibc-bin() {
    pkgdesc="Xuantie 900 LLVM glibc toolchain targeting platform linux 6.6.0"
    install -dm0755 "${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin}" --no-same-owner --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/${_toolchain_name}/${pkgname%-bin}/bin ] && append_path '/opt/${_toolchain_name}/${pkgname%-bin}/bin'

export PATH
EOF
}


package_xuantie-900-llvm-manual() {
    pkgdesc="Xuantie 900 LLVM manual"
    install -dm0755 ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin}

    cp -ar ${srcdir}/*${pkgver}.pdf ${pkgdir}/opt/${_toolchain_name}/${pkgname%-bin}
}
