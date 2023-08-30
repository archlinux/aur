# Maintainer: taotieren <admin@taotieren.com>

pkgname=csky-debugserver-bin
pkgver=5.16.11
pkgrel=0
epoch=
pkgdesc="C-Sky Debugger Server"
arch=('x86_64')
url="https://occ.t-head.cn/community/download?id=41336344657653"
license=('BSD')
groups=()
depends=(bash)
makedepends=(libarchive)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("T-Head Debugger Server User Guide ZH-CN v5.16.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1659579718572/T-Head+Debugger+Server+User+Guide+%28ZH-CN%29_v5.16.pdf"
        "${pkgname}-${pkgver}.sh.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1691553051819/T-Head-DebugServer-linux-x86_64-V5.16.11-20230803.sh.tar.gz"
        "DebugServer User Guide_v5.10.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1588909480730/C-Sky+Debugger+Server+User+Guide_v5.10.pdf"
        "DebugServer User Guide v5.6.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1588916696490/C-Sky+Debugger+Server+User+Guide+v5.6.pdf")
noextract=()
sha256sums=('2b64d17b6589ec5252ad610a79ba15857cc3257c970d3a0dee61d0358dca7162'
            'b6af02ab6dbd89e5cbd73fa153ebded9bb6d4730e58c588d165f61768b376e61'
            '6a004189c409a66f550c676990c637b08cbad5f928fed6e0309caf95fe1e62c2'
            '6a004189c409a66f550c676990c637b08cbad5f928fed6e0309caf95fe1e62c2')
#validpgpkeys=()

package() {
    tail -n +282 "${srcdir}"/*${pkgver}*.sh > "${srcdir}/${pkgname}-${pkgver}.tar.gz"
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --no-same-owner --no-same-permissions --strip-components=1 -C "${pkgdir}/opt/t-head/${pkgname%-bin}"
    cp -r "${srcdir}"/*.pdf "${pkgdir}/opt/t-head/${pkgname%-bin}"

    install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.csh" << EOF
setenv PATH "${PATH}:/opt/t-head/${pkgname%-bin}"
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" << EOF
#!/bin/env bash
export PATH=/opt/t-head/${pkgname%-bin}:\$PATH
DebugServerConsole.elf "\$@"
EOF
}
