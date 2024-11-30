# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgbase=xuantie-900-llvm-toolchain-bin
pkgname=(
    $pkgbase
    xuantie-900-llvm-elf-newlib-bin
    xuantie-900-llvm-linux-glibc-bin
)
pkgver=2.0.1
pkgrel=1
arch=('x86_64')
url=https://www.xrvm.cn/community/download?id=4382929556173033472
license=('unknown')
_dwurl="https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/"
_linux_ver=6.6.0
source=(
    "xuantie-900-llvm-elf-newlib-bin-${pkgver}.tar.gz::${_dwurl}/1732890326920/Xuantie-900-llvm-elf-newlib-${arch}-V${pkgver}-20241121.tar.gz"
    "xuantie-900-llvm-linux-glibc-bin-${pkgver}.tar.gz::${_dwurl}/1732893794797/Xuantie-900-llvm-linux-${_linux_ver}-glibc-${arch}-V${pkgver}-20241121.tar.gz"
)

sha256sums=('4e71a6efd86203a180775be78068204e21c12dfcc400bf221b2d8f41da101f5c'
            '2359597e3b88fb5817bb894d6c82e15d62f8575abc82bad7e1a53678dca377cc')

noextract=(
    xuantie-900-llvm-elf-newlib-bin-${pkgver}.tar.gz
    xuantie-900-llvm-linux-glibc-bin-${pkgver}.tar.gz
)
_toolchain_name="xuantie-900-llvm"

package_xuantie-900-llvm-toolchain-bin() {
    pkgdesc="Xuantie 900 LLVM toolchain"
    depends=(xuantie-900-llvm-elf-newlib-bin xuantie-900-llvm-linux-glibc-bin)
}

package_xuantie-900-llvm-elf-newlib-bin() {
    pkgdesc="Xuantie 900 LLVM elf newlib toolchain"
    install -dm0755 "${pkgdir}/opt/xuantie-900-llvm/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/xuantie-900-llvm/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/xuantie-900-llvm/${pkgname%-bin}/bin ] && append_path '/opt/xuantie-900-llvm/${pkgname%-bin}/bin'

export PATH
EOF
}

package_xuantie-900-llvm-linux-glibc-bin() {
    pkgdesc="Xuantie 900 LLVM glibc toolchain"
    install -dm0755 "${pkgdir}/opt/xuantie-900-llvm/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/xuantie-900-llvm/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/xuantie-900-llvm/${pkgname%-bin}/bin ] && append_path '/opt/xuantie-900-llvm/${pkgname%-bin}/bin'

export PATH
EOF
}
