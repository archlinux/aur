# Maintainer: taotieren <admin@taotieren.com>

pkgbase=loongson-gnu-toolchain-bin
pkgname=(${pkgbase})
_tagname=8.3-x86_64-loongarch64-linux-gnu-rc1.6
_base_ver=$(echo "$_tagname" | cut -d'-' -f1)
_rc_ver=$(echo "$_tagname" | rev | cut -d'-' -f1 | rev)
pkgver=${_base_ver}_${_rc_ver}
pkgrel=1
arch=('x86_64')
pkgdesc="loongson gnu toolchain"
url=http://ftp.loongnix.cn/toolchain/gcc/release/loongarch/gcc8/
license=(
    GPL-3.0-with-GCC-exception
    GFDL-1.3-or-later)
provides=(${pkgbase%-bin} loongson-gcc)
conflicts=(${pkgbase%-bin} loongson-gcc)
depends=(
    bash
    perl
    python
)
makedepends=()
_pkg_file=${pkgbase%-bin}-${_base_ver}-${CARCH}-loongarch64-linux-gnu-${_rc_ver}.tar.xz
source=("${_pkg_file}::${url}/${_pkg_file}")
sha256sums=('fb39d178b6760f49852e8452c092bfc176a98c3166ce13b7d700e3da9e99e237')
options=(!strip !emptydirs !debug)
install=${pkgname}.install
noextract=(${_pkg_file})

package() {
    install -dm0755 "${pkgdir}/opt/loongson/${pkgname%-bin}"

    bsdtar -xf "${srcdir}/${_pkg_file}" --strip-components=1 -C "${pkgdir}/opt/loongson/${pkgname%-bin}" --no-same-owner  --no-same-permissions

    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
# loongson gnu toolchain

[ -d /opt/loongson/${pkgname%-bin}/bin ] && append_path '/opt/loongson/${pkgname%-bin}/bin'

export PATH
EOF
    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.csh" << EOF
# loongson gnu toolchain

setenv PATH "${PATH}:/opt/loongson/${pkgname%-bin}/bin"
EOF
}

# vim: ts=4 sw=4 et
