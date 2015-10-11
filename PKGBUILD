# Maintainer : Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor : Raansu <Gero3977 "at" gmail {dot} com>
# Contributor : adytzu2007 <adybac "at" gmail {dot} com>
# Contributor : Shaumux <shaumya "at" gmail {dot} com>
# Contributor : Alain Kalker <a {dot} c {dot} kalker "at" gmail {dot} com>
# Contributor : Willy Sudiarto Raharjo < willysr "at" slackware-id {dot} com>

pkgname=vmware-modules-dkms
_pkgbase=vmware-modules
pkgver=308.0
pkgrel=1
pkgdesc="VMware Workstation kernel modules (DKMS)"
arch=('i686' 'x86_64')
url="http://www.vmware.com/"
license=('GPL2')
conflicts=('open-vm-tools-modules')

_vmware_location=/lib/vmware/modules/source

depends=('dkms')
makedepends=('linux')
optdepends=('linux-headers: needed to build the module')
options=('!buildflags')
install=${pkgname}.install
source=('Makefile'
        '60-vmware.rules'
        'dkms.conf.in'
        'vmblock.patch'
        'vmci.patch'
        'vmmon.patch'
        'vmnet.patch'
        'vsock.patch')
sha256sums=('ee3e5cfac51703ac392bce540e3375680c579eaac7aa31990e1e08ada589e89b'
            '7baecdfd979d57aed7dac0db57e0165fc1730b15ed6bf42ed25571e68ec34b52'
            '707596776b0b232f7f5de4a0ddff12262df3bc934180afd956ea2ee45ac4db9e'
            'ebe4d463c878b134c37e7382198f0771eb73d5952201ac28ead62242ea11da88'
            'f009eba206644a97de7d7cd080a1e4517eb2c452984e3df53e94dbe2c887e4ce'
            '06fc4a6d3c89b147089bca1f6df3b4fc58e819e4a089b76acf0f2463ee0fa215'
            'fe0018729d8ee9c2a333e9ab2125ea9e228613a743b4a692ad39a06cda7568c2'
            'eb17a0563f8e9e1e5667e73a167c397e626ef7ab65cb7c10f418b421a36cf714')

build()
{
    cd ${srcdir}

    # create dkms.conf
    sed -e "s/@PKGNAME@/$_pkgbase/; s/@PKGVER@/$pkgver/" < ${srcdir}/dkms.conf.in > ${srcdir}/dkms.conf
}

package()
{
    # make folder for dkms
    install -m755 -d ${pkgdir}/usr/src/${_pkgbase}-${pkgver}

    install -D -m0644 ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf
    install -D -m0644 ${srcdir}/Makefile ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/Makefile
    install -D -m0644 ${srcdir}/vmblock.patch ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/vmblock.patch
    install -D -m0644 ${srcdir}/vmci.patch ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/vmci.patch
    install -D -m0644 ${srcdir}/vmmon.patch ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/vmmon.patch
    install -D -m0644 ${srcdir}/vmnet.patch ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/vmnet.patch
    install -D -m0644 ${srcdir}/vsock.patch ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/vsock.patch

    install -D -m0644 ${srcdir}/60-vmware.rules ${pkgdir}/etc/udev/rules.d/60-vmware.rules
}
