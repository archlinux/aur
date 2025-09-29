# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgbase=xuantie-900-llvm-toolchain-bin
_platform_linux_ver1=linux-6.6.0
pkgname=(
    $pkgbase
    xuantie-900-llvm-elf-newlib-bin
    xuantie-900-llvm-${_platform_linux_ver1}-glibc-bin
    xuantie-900-llvm-manual
)
pkgver=2.2.1
pkgrel=1
arch=('x86_64')
url=https://www.xrvm.cn/community/download?id=4460157247602888704
license=('unknown')
_dwurl=https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/
_date=20250701
source=(
    "xuantie-900-llvm-elf-newlib-bin-${pkgver}.tar.gz::${_dwurl}/1751457673900/Xuantie-900-llvm-elf-newlib-${arch}-V${pkgver}-${_date}.tar.gz"
    "xuantie-900-llvm-${_platform_linux_ver1}-glibc-bin-${pkgver}.tar.gz::${_dwurl}/1756172541396/Xuantie-900-llvm-${_platform_linux_ver1}-glibc-${arch}-V${pkgver}-${_date}.tar.gz"
    # Documentation
    "ReleaseNote ${pkgver}.pdf::${_dwurl}/1751457406048/ReleaseNote.pdf"
    "XuanTieCustomExtensionV0.9.0 ${pkgver}.pdf::${_dwurl}/1756437113530/XuanTieCustomExtensionV0.9.0.pdf"
)

sha256sums=('9e4255b334d97d1b84a0e6748b2cb8068414bb08ff52aac6c020f2cfcf4bfa1c'
            '38a23cbe3b738c7021a2be4046e76a3a37b97d961e9719275ed90ea78d931ec2'
            '2cd9320008bf3e169236fb9bbefccfeb09a6b55ecad6dc788f71b6bd3e955ea5'
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
