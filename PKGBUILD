# Author: Christoph Jaeger <christophjaeger@linux.com>
# Maintainer: Marc Rozanc <marc@rozanc.fr>

_modname="tuxedo-wmi"
pkgname="${_modname}-dkms"
pkgver="1.5.1"
pkgrel=1
pkgdesc='A reverse engineering driver for the Clevo P150EM/P170EM/P150SM/P157SM/P170SM/P177SM backlight keyboard, by Christoph Jaeger (DKMS version)'
arch=('any')
license=('GPL')
url='http://www.linux-onlineshop.de/forum/index.php?page=Thread&threadID=26&s=82130b57e71bd5b6ea569abc1424025c6f8d412d'
depends=('dkms' 'linux-headers')
provides=("tuxedo-wmi")
replaces=("clevo-wmi-dkms")
conflicts=("clevo_wmi-git" "clevo-wmi" "clevo-wmi" "clevo-wmi-dkms" "tuxedo-wmi")
source=("tuxedo-wmi-${pkgver}.src.tar.gz::http://www.linux-onlineshop.de/forum/index.php?page=Attachment&attachmentID=424&h=3df4c21145314ceaeadd7986662b2a5b01d1094f&s=5196669c65535d86e616f839936c42a5166a40a0"
        "dkms.conf.in")
md5sums=('c5bf0f815f394baf4fabe2c78d9483cc'
         '75fa1f51d5b4c15edcdfb8d60dd6ae54')
install='tuxedo-wmi-dkms.install'


build() {
    cd "${srcdir}/tuxedo-wmi-${pkgver}/src"
    make
}

package() {
    cd "${srcdir}/tuxedo-wmi-${pkgver}/src"

    install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
    for i in "${srcdir}/${_modname}-${pkgver}/src/"{Makefile,tuxedo-wmi.c}; do
        install -D -m644 "${i}" "${pkgdir}/usr/src/${_modname}-${pkgver}/"
    done
    sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
}

