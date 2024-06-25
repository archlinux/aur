# Maintainer: taotieren <admin@taotieren.com>

pkgbase=loongson-gnu-toolchain-bin
pkgname=(${pkgbase})
pkgver=8.3_rc1.4
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
    perl
    python)
makedepends=()
_pkg_file=${pkgbase%-bin}-${pkgver%%_*}-${CARCH}-loongarch64-linux-gnu-${pkgver#*_}.tar.xz
source=("${_pkg_file}::${url}/${_pkg_file}")
sha256sums=('6883f7b4783430da9b2d76ade1373138659ebae7eca40cba002e343e331be747')
options=(!strip !emptydirs !debug)
install=${pkgname}.install
noextract=(${_pkg_file})

package() {
    install -dm0755 "${pkgdir}/opt/loogson/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${_pkg_file}" --strip-components=1 -C "${pkgdir}/opt/loogson/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
# loongson gnu toolchain

[ -d /opt/loogson/${pkgname%-bin}/bin ] && append_path '/opt/loogson/${pkgname%-bin}/bin'

export PATH
EOF
    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.csh" << EOF
# loongson gnu toolchain

setenv PATH "${PATH}:/opt/loogson/${pkgname%-bin}/bin"
EOF
}

# vim: ts=4 sw=4 et
