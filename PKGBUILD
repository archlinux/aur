# Maintainer: taotieren <admin@taotieren.com>

pkgbase=loongson-gnu-toolchain-bin
pkgname=(${pkgbase})
pkgver=8.3_rc1.3
pkgrel=1
arch=('x86_64')
pkgdesc="loongson gnu toolchain"
url=http://ftp.loongnix.cn/toolchain/gcc/release/loongarch/gcc8/
license=(GPL-3.0-with-GCC-exception
    GFDL-1.3-or-later)
provides=(${pkgbase%-bin} loongson-gcc)
conflicts=(${pkgbase%-bin} loongson-gcc)
depends=(
    bash
    gcc-libs
    perl
    python)
makedepends=()
source=("${pkgbase%-bin}-${pkgver%%_*}-${CARCH}-loongarch64-linux-gnu-${pkgver#*_}-1.tar.xz::${url}/${pkgbase%-bin}-${pkgver%%_*}-${CARCH}-loongarch64-linux-gnu-${pkgver#*_}-1.tar.xz")
sha256sums=('ae348afcd27a7c0fa6a58f1358842a3dbef8a4851ed018b43ddc4dac676649b8')
options=(!strip !emptydirs !debug)
noextract=(${pkgbase%-bin}-${pkgver%%_*}-${CARCH}-loongarch64-linux-gnu-${pkgver#*_}-1.tar.xz)

package() {
    install -dm0755 "${pkgdir}/opt/loogson/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${pkgbase%-bin}-${pkgver%%_*}-${CARCH}-loongarch64-linux-gnu-${pkgver#*_}-1.tar.xz" --strip-components=1 -C "${pkgdir}/opt/loogson/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/loogson/${pkgname%-bin}/bin ] && append_path '/opt/loogson/${pkgname%-bin}/bin'

export PATH
EOF
}

# vim: ts=4 sw=4 et
