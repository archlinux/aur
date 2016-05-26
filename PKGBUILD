# Maintainer : Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor : Raansu <Gero3977 "at" gmail {dot} com>
# Contributor : adytzu2007 <adybac "at" gmail {dot} com>
# Contributor : Shaumux <shaumya "at" gmail {dot} com>
# Contributor : Alain Kalker <a {dot} c {dot} kalker "at" gmail {dot} com>
# Contributor : Willy Sudiarto Raharjo < willysr "at" slackware-id {dot} com>

pkgname=vmware-modules-dkms
_pkgbase=vmware-modules
pkgver=308.0
pkgrel=7
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
            '48951fcb72e1f964e21dc3f7ea4729dd673936abdd28b54008dbca9b0967683f'
            '3f6bcef6e88718a4d2b5aba8a10856ad0857006755c2ccaa5de8fc596441770c'
            '9a1973abf269d7c9d49b8789e7a2e55595e712e644b2eade849fa19510b0c2f3'
            '2eb2ad24722e0ddd97387c48266295204aea95de8970eec427e3931769d15e19'
            'a97e5096ef1b1595b2d1ed6b86b0fde80e34c6310f566156bcd4f5d660a74a58')

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
