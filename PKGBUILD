# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-toolchain-900-series-bin
pkgname=($pkgbase csky-riscv64-linux-900-series-bin csky-riscv64-elf-900-series-bin csky-toolchain-900-series-guide-bin)
pkgver=1.12.0
pkgrel=1
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=3927429448189939712'
license=('Apache')
provides=()
#conflicts=()
depends=('filesystem')
makedepends=('tar')

source=("https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/null/1614234913073/ReleaseNotes.pdf"
        "csky-riscv64-linux-900-series-bin-${pkgver}.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1624260655742/riscv64-linux-x86_64-20210618.tar.gz"
        "csky-riscv64-elf-900-series-bin-${pkgver}.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1624260502686/riscv64-elf-x86_64-20210618.tar.gz"
        "https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1836682/1624260306781/ReleaseNote.pdf"
        "T-HEAD RISC-V LD Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1577083695234/T-HEAD+RISC-V+LD+Manual+V1.4.2.pdf"
        "T-HEAD RISC-V GCC Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1577083609604/T-HEAD+RISC-V+GCC+Manual+V1.4.2.pdf"
        "T-HEAD RISC-V GDB Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1577083669041/T-HEAD+RISC-V+GDB+Manual+V1.4.2.pdf"
        "T-HEAD RISC-V AS Manual.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1577083640288/T-HEAD+RISC-V+AS+Manual+V1.4.2.pdf"
        "T-HEAD软件开发指南V1.7.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1615892629021/T-HEAD%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E6%8C%87%E5%8D%97V1.7.pdf"
        )

sha256sums=('e70dca4e839c503d0efff7b078c5418f0d28d0e79a032d50e5e39682507c82ae'
            'e458b2f914c93788f1a616fa35bafe0049b4418f2fcabf481215976f73749c59'
            'cbcc962fbd025c599e42626c8df947e175c82da655e393e561f1daa9d419b3ba'
            'fa50226512df02aaf348a36825c40b715fc320f66a2603e79426344f93b4a912'
            'a132754abca8e8956169a33f4239ef14e8f309259168dc8c0531e4df19e1f0f2'
            '02c47ffb157456711bb0ad3f9848a02ee939e17cf0ed649d985b2dd0c6f744de'
            '87cf75b68fa5792905cc4e1f0649a7b382c30d5986d479d1cd36d94a36c9e0a9'
            '19b7b689c92a8fc762c7e2c3ca05798f432a41d6a05a3ae69a6f96333c73c404'
            'f552d20599d73f824e44a03d8ca49fe74b59e838a97352a2596042ba8cad422f')

noextract=(csky-riscv64-linux-900-series-bin-${pkgver}.tar.gz csky-riscv64-elf-900-series-bin-${pkgver}.tar.gz)

package_csky-toolchain-900-series-bin() {
    pkgdesc="C-Sky toolchain 900 series"
    depends=(csky-riscv64-linux-900-series-bin csky-riscv64-elf-900-series-bin csky-toolchain-900-series-guide-bin)
}

package_csky-riscv64-linux-900-series-bin() {
    pkgdesc="C-Sky riscv64 linux for 900 series"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    tar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/t-head/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF
}

package_csky-riscv64-elf-900-series-bin() {
    pkgdesc="C-Sky riscv64 elf for 900 series"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    tar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/t-head/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF
}


package_csky-toolchain-900-series-guide-bin() {
    pkgdesc="C-Sky toolchain guide for 900 series"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    cp -r "${srcdir}"/*.pdf "${pkgdir}/opt/t-head/${pkgname%-bin}"
}
# vim: ts=4 sw=4 et
