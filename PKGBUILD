# Maintainer: Marc ROZANC <marc@rozanc.fr>

_modname='clevo-xsm-wmi'
pkgname="${_modname}-dkms"
pkgver='0.4'
_pkgtag='ea6d0253b59f'
pkgrel=1
pkgdesc='A reverse engineering driver for the Clevo SM series backlight keyboard (DKMS version)'
arch=('i686' 'x86_64')
license=('GPL')
url='https://bitbucket.org/lynthium/clevo-xsm-wmi'
source=("clevo-xsm-wmi-${pkgver}.src.tar.gz::https://bitbucket.org/lynthium/clevo-xsm-wmi/get/v${pkgver}.tar.gz"
        "dkms.conf.in")
options=(!emptydirs)
conflicts=('clevo-xsm-wmi' 'tuxedo-wmi' 'tuxedo-wmi-dkms')
depends=('dkms' 'linux-headers')
md5sums=('9a9b35fcf80113cf0b4a551bbf73ea59'
         '2ba847baebeee1b60a900d09b0e426da')
install='clevo-xsm-wmi-dkms.install'

build() {
    cd "${srcdir}/lynthium-clevo-xsm-wmi-${_pkgtag}/module"
    make
}

package() {
    cd "${srcdir}/lynthium-clevo-xsm-wmi-${_pkgtag}/module"

    install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
    
    for i in "${srcdir}/lynthium-${_modname}-${_pkgtag}/module/"{Makefile,clevo-xsm-wmi.c}; do
        install -D -m644 "${i}" "${pkgdir}/usr/src/${_modname}-${pkgver}/"
    done
    sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf" 

    install -D -m644 /usr/share/licenses/common/GPL2/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

