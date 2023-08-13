pkgname=mechrevo-wujie14-dkms
_pkgname=mechrevo-wujie14-kmod
_dkms_pkgname=wujie14-km
pkgrel=1
pkgver=0.1
pkgdesc='A powerprofile and keyboard backlight driver kernel module for Mechrevo WUJIE14 laptop'
url='https://github.com/xuwd1/mechrevo-wujie14-kmod/tree/master'
arch=(x86_64)
license=(GPL)
depends=(dkms)
makedepends=(git make cmake)
_tag='6805bc20437273648fac863abcd8b13890234c26' # git rev-parse v${pkgver}
source=("git+https://github.com/xuwd1/${_pkgname}.git#tag=${_tag}")
b2sums=('SKIP')

prepare() {
    cd ${_pkgname}
    mkdir -p build && cd build
    cmake .. -DHEADER_BUILD=OFF -DDKMS=ON -G'Unix Makefiles'
}


package() {
    echo $(pwd)
    install -Dm644 $_pkgname/{Kbuild,dkms.conf} -t ${pkgdir}/usr/src/${_dkms_pkgname}-${pkgver}
    cp -f ${_pkgname}/wujie14-*.{c,h} ${pkgdir}/usr/src/${_dkms_pkgname}-${pkgver}
    echo wujie14 | install -Dm644 /dev/stdin ${pkgdir}/usr/lib/modules-load.d/${_dkms_pkgname}.conf
}
