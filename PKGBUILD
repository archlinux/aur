# Maintainer: yifwon <wyf9661 at gmail dot com>
pkgbase=sylixos-cross-compiler-toolchain
pkgname=('sylixos-cross-compiler-toolchain' 'sylixos-cross-compiler-lcsproxy' 'sylixos-cross-compiler-senseshield')
pkgver=0.4.0
_lcsproxy_ver=1.0.6
_senseshield_ver=2.7.0.66418
pkgrel=2
pkgdesc="cross compile toolchain to build objects running on sylixos"
arch=('x86_64')
url="http://10.7.0.200:9000/RealEvo-IDE/realevo-linux-tools-v$pkgver.tar.gz"
license=('custom')
options=(!strip)
depends=('systemd')
source_x86_64=("realevo-linux-tools-$pkgver.tar.gz"::$url)
sha1sums_x86_64=('0f49a875637aa2ee3b8d53c124ca7d66ce88c900')

package_sylixos-cross-compiler-toolchain() {
    _install_dir="opt/sylixos"
    #extracting
    install -dm755 "${pkgdir}/${_install_dir}"
    tar --no-same-owner --no-same-permissions -xaf ${srcdir}/realevo-linux-tools/compiler_pub.tar.gz -C "${pkgdir}/${_install_dir}"

    #symlinking
    install -dm755 "${pkgdir}/usr/bin"
    for platform in ${pkgdir}/${_install_dir}/compiler/*-toolchain; do
        for component in $platform/bin/*; do
            ln -sf ${component##$pkgdir} ${pkgdir}/usr/bin/
        done
    done
}

package_sylixos-cross-compiler-lcsproxy() {
    ar x ${srcdir}/realevo-linux-tools/lcsproxy-${_lcsproxy_ver}-linux-amd64.deb
    tar --no-same-owner --no-same-permissions -xavf data.tar.gz -C ${pkgdir}
    mv ${pkgdir}/bin ${pkgdir}/usr
}

package_sylixos-cross-compiler-senseshield() {
    ar x ${srcdir}/realevo-linux-tools/senseshield-lcc-${_senseshield_ver}-amd64.deb
    tar --no-same-owner --no-same-permissions -xavf data.tar.xz -C ${pkgdir}
}
