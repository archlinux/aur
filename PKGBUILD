# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
#

pkgname='tn40xx'
pkgdesc="Tehuti Networks tn40xx network driver."
pkgver='0.3.6.12.1'
pkgrel=1
arch=('x86_64')
url='http://www.tehutinetworks.net/'
license=('custom')
depends=('linux-lts')
makedepends=('linux-lts-headers')
options=('!libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')
source=("http://www.tehutinetworks.net/images/UL240756/${pkgname}-${pkgver}.tgz")
sha512sums=('9d8391a6189f57541ace4ffee3097178a5110587dc86763647b20b8b0376f96da1fa02a3679578e5ce8fe56c56fe6e0bbb9f4fb4c6ef9d7854b11a3713f7830c')
#install=

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    #install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    #install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -m644 Readme release_notes \
            "${pkgdir}/usr/share/doc/${pkgname}"
    install -dm755 "${pkgdir}/lib/modules/$(uname -r)/drivers/net/"
    install -m755 ${pkgname}.ko "${pkgdir}/lib/modules/$(uname -r)/drivers/net/"
    install -dm755 "${pkgdir}/etc/pm/config.d/"
    echo "SUSPEND_MODULES=${pkgname}" > "${pkgdir}/etc/pm/config.d/${pkgname}"
    depmod "$(uname -r)"
}
