# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csky-cpu-c910-csi-rtos-sdk
pkgname=($pkgbase csky-cpu-c910-simulation-platform)
pkgver=1.7.3
pkgrel=1
arch=('x86_64')
url='https://occ.t-head.cn/community/download?id=581565156799021056'
license=('unkown')
provides=()
#conflicts=()
depends=()
makedepends=('libarchive' 'unarchiver')

source=(
        "csky-cpu-c910-csi-rtos-sdk-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/null/1609222628333/smarth-C910-RV64-1.7.3.zip"
        "csky-cpu-c910-simulation-platform-${pkgver}.zip::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1573490152581/%E7%8E%84%E9%93%81910%E4%BB%BF%E7%9C%9F%E5%B9%B3%E5%8F%B0-%E4%BD%BF%E7%94%A8%E8%A7%86%E9%A2%91-%E6%8C%87%E5%AF%BC%E6%89%8B%E5%86%8C.zip"
        )

sha256sums=('71c24394020e3324d456bc533269fdaf307a65813bcaa56eac73f8fcc4ec4fea'
            'a1826f05409d47e37d2b241bf9aa0976e1f9b668ea5d37bd44c24e732fb313a1')

noextract=(csky-cpu-ck910f-csi-rtos-sdk-${pkgver}.zip csky-cpu-c910-simulation-platform-${pkgver}.zip)

package_csky-cpu-c910-csi-rtos-sdk() {
    pkgdesc="C-Sky CPU C910 CSI-RTOS SDK"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
}

package_csky-cpu-c910-simulation-platform() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="C-Sky CPU C910 simulation platform"
    install -dm0755 "${pkgdir}/opt/t-head/cpu/${pkgname}"
    unar -e GBK "${srcdir}/${pkgname}-${pkgver}.zip"
    bsdtar xf "${srcdir}/${pkgname}-${pkgver}/玄铁910仿真平台.tar.gz" --strip-components=1 -C  "${pkgdir}/opt/t-head/cpu/${pkgname}"
    unar -e GBK "${srcdir}/${pkgname}-${pkgver}/玄铁910仿真平台使用视频.zip" -o  "${pkgdir}/opt/t-head/cpu/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/玄铁910仿真平台指导手册.pdf" "${pkgdir}/opt/t-head/cpu/${pkgname}"
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/csky-cpu-c910-run-case" << EOF
#!/bin/env bash
exec /opt/t-head/cpu/${pkgname}/tools/run_case "\$@"

EOF
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/csky-cpu-c910-srec2vmem" << EOF
#!/bin/env bash
exec /opt/t-head/cpu/${pkgname}/tools/Srec2vmem "\$@"

EOF
}
# vim: ts=4 sw=4 et
