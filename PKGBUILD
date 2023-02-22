# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-toolchain-900-series-bin
pkgname=($pkgbase csky-riscv64-linux-900-series-bin csky-riscv64-elf-900-series-bin csky-toolchain-900-series-guide-bin)
pkgver=2.2.3
pkgrel=0
arch=('x86_64')
_id=3988303250540531712
url=https://occ.t-head.cn/community/download?id=${_id}
license=('Apache')
provides=()
#conflicts=()
depends=('filesystem')
makedepends=('libarchive')
_url="https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource"
_dwurl="${_url}/1836682"
source=("csky-riscv64-linux-900-series-bin-${pkgver}.tar.gz::${_dwurl}/1638774253840/Xuantie-900-gcc-linux-5.10.4-glibc-x86_64-V2.2.3-20211204.tar.gz"
        "csky-riscv64-elf-900-series-bin-${pkgver}.tar.gz::${_dwurl}/1638774339622/Xuantie-900-gcc-elf-newlib-x86_64-V2.2.3-20211204.tar.gz"
        "ReleaseNote ${pkgver}.pdf::${_dwurl}/1638777376512/ReleaseNote.pdf"
        "Xuantie 900 Series Assembler Manual ${pkgver}.pdf::${_dwurl}/1638774061568/Xuantie+900+Series+Assembler+Manual.pdf"
        "Xuantie 900 Series Binutils Manual ${pkgver}.pdf::${_dwurl}/1638774078901/Xuantie+900+Series+Binutils+Manual.pdf"
        "Xuantie 900 Series Compiler Manual ${pkgver}.pdf::${_dwurl}/1638774096719/Xuantie+900+Series+Compiler+Manual.pdf"
        "Xuantie 900 Series GDB Manual ${pkgver}.pdf::${_dwurl}/1638774133453/Xuantie+900+Series+GDB+Manual.pdf"
        "Xuantie 900 Series Linker Manual ${pkgver}.pdf::${_dwurl}/1638774154929/Xuantie+900+Series+Linker+Manual.pdf"
        "Xuantie 900 Series P-0.9.4 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1638774176038/Xuantie+900+Series+P-0.9.4+Intrinsic+Manual.pdf"
        "Xuantie 900 Series RVV-0.7.1 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1638774209491/Xuantie+900+Series+RVV-0.7.1+Intrinsic+Manual.pdf"
        "Xuantie 900 Series RVV-1.0 Intrinsic Manual ${pkgver}.pdf::${_dwurl}/1638774229649/Xuantie+900+Series+RVV-1.0+Intrinsic+Manual.pdf"
        "玄铁CPU软件开发指南V2.2 ${pkgver}.pdf::${_url}//1659515330848/%E7%8E%84%E9%93%81CPU%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E6%8C%87%E5%8D%97V2.2.pdf"
        "XuanTie Linux 开发平台使用说明 ${pkgver}.pdf::${_url}//1668484121020/XuanTie+Linux+%E5%BC%80%E5%8F%91%E5%B9%B3%E5%8F%B0%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E_20221111.pdf")

sha256sums=('8528403d81be6e51eee277b54cd4db19f876253272e732b7f743a23d992a98a0'
            'c7422cb92dcc12fd2c520fa9eb97055f44c1ac46a16733d2292342be513861e3'
            '1e97e675a5f563f5a155fffa2e76c2a0f6f3916ee523731ccbbe638eb9d854a0'
            'eff605bfcc0926248720678cf53d53d83e65932088c80e5f261ba3e9d3f6ce29'
            '0ddfda9876921b9ab598821f3d1a9f4b7a6cf6290f7f7c94cd362769e7fe775b'
            '61cd5daad7c6fcdf8bfe8267f46a627475b196bb81e2d90b2e049b17609810fe'
            'bac49639b2ca60d2876c341aecc0b683ff48645a769fe1cbbefa263e07b967b3'
            'a5264c6e50cc9ad18cfc5de3dfb41187ad2c494b5cf275cc40d3c883a0a8ba83'
            '595aece3631d8c82429c2f95a91bbf8cd908eb89b173b2d2e7f99fd0e45f2076'
            'af15bdfa7bd5bdff7dabab71820cf2c60f2c3dac0ebd0482c4ca465a5c57557b'
            '42bfa1a59c52cbe36a6c5792d367c33026c009f0289fc1fec7601c4aeda71e86'
            '459643494c06d46fb329d5fb39e68e6741fae713610faeeb8fae4026be751b2c'
            '77bf95d0126a4401b6685aa93225181ed49dc55e5c0b04bbbae624a582722452')

noextract=(csky-riscv64-linux-900-series-bin-${pkgver}.tar.gz csky-riscv64-elf-900-series-bin-${pkgver}.tar.gz)

package_csky-toolchain-900-series-bin() {
    pkgdesc="C-Sky toolchain 900 series (Xuantie)"
    depends=(csky-riscv64-linux-900-series-bin csky-riscv64-elf-900-series-bin csky-toolchain-900-series-guide-bin)
}

package_csky-riscv64-linux-900-series-bin() {
    pkgdesc="C-Sky riscv64 linux for 900 series (Xuantie)"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/t-head/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF
}

package_csky-riscv64-elf-900-series-bin() {
    pkgdesc="C-Sky riscv64 elf for 900 series (Xuantie)"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/t-head/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF
}


package_csky-toolchain-900-series-guide-bin() {
    pkgdesc="C-Sky toolchain guide for 900 series (Xuantie)"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    cp -rva "${srcdir}"/*${pkgver}.pdf "${pkgdir}/opt/t-head/${pkgname%-bin}"
}
# vim: ts=4 sw=4 et
