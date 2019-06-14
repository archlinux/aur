# Maintainer: Edward Pacman < edward(at)edward(minus)p(dot)xyz >
# Contributor: Kurobac <kurobac(at)foxmail(dot)com>

_pkgbase=alx-wol
pkgname=${_pkgbase}-dkms
pkgver=4
pkgrel=1
pkgdesc="The alx kernel module with a patch enabling WoL applied"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
optdepends=('linux-headers: Needed for build the module for Arch kernel'
	'linux-lts-headers: Needed for build the module for LTS Arch kernel'
	'linux-zen-headers: Needed for build the module for ZEN Arch kernel')
source=(https://git.archlinux.org/linux.git/plain/drivers/net/ethernet/atheros/alx/{alx.h,ethtool.c,hw.c,hw.h,main.c,reg.h}
        000-enable-alx-wol.patch
        Kbuild
        dkms.conf)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '3d0549a45f78595bfdcd9d6e14f115ecc159583a39d51b23aa3c9852630823d0'
            '8a62bb5adf6e554f470f88f8da58da0ce05cb8276ab56fb45ed5d31c71665d39'
            'f3aefc85fd246a74ee2be831c15b6440d22c497e84fba1f57e152c82f2946d1a')

prepare(){
    mkdir "${srcdir}/workdir"
    cd "${srcdir}/workdir"
    cp "${srcdir}/"{alx.h,ethtool.c,hw.c,hw.h,main.c,reg.h} .
    patch -p1 < ../000-enable-alx-wol.patch
}

package() {
    local dest="$pkgdir/usr/src/${_pkgbase}-$pkgver"
    mkdir -p $dest
    cd "${srcdir}/workdir/"
    cp --preserve=all {alx.h,ethtool.c,hw.c,hw.h,main.c,reg.h} $dest
    cd "${srcdir}"
    cp --preserve=all Kbuild dkms.conf $dest
}
