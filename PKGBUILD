# Maintainer: taotieren <admin@taotieren.com>

pkgname=csky-debugserver-bin
pkgver=5.18.10
pkgrel=3
epoch=
pkgdesc="C-Sky Debugger Server"
arch=('x86_64')
url="https://www.xrvm.cn/community/download?id=4380347564587814912"
license=('BSD')
groups=()
depends=(
    sh
    libgcc_s.so
    libstdc++.so
    libusb
)
makedepends=(libarchive)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip !debug)
install=
changelog=
source=(
    "${pkgname}-${pkgver}.sh.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1781751151864/XuanTie-DebugServer-linux-x86_64-V5.18.10-20260603.sh.tar.gz"
    "DebugServer User Guide_v5.18.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1781751413408/Debugger+Server+User+Guide%28ZH-CN%29.pdf"
)
noextract=()
sha256sums=('24413810f02160e262a04cf22835adadf061c120f5ad9a7a4b3f2c821a122194'
            '97888c3dc282f167cf2f627e2bde70ea678169c4855b98b8a4cf157b963c3b11')
#validpgpkeys=()

package() {
    tail -n +285 "${srcdir}"/*${pkgver}*.sh >"${srcdir}/${pkgname}-${pkgver}.tar.gz"

    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --no-same-owner --no-same-permissions --strip-components=1 -C "${pkgdir}/opt/t-head/${pkgname%-bin}"

    install -Dm0644 "${srcdir}"/*.pdf -t "${pkgdir}/opt/t-head/${pkgname%-bin}"

    #     install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.csh" <<EOF
    # setenv PATH "${PATH}:/opt/t-head/${pkgname%-bin}"
    # EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" <<EOF
#!/bin/env bash
export PATH=/opt/t-head/${pkgname%-bin}:\$PATH
cd /opt/t-head/${pkgname%-bin}
exec DebugServerConsole.elf "\$@"
EOF
}
