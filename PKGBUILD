# Maintainer: Fell <fell@fellr.net>

pkgname=plasticscm-client-core
pkgver=11.0.16.9213
pkgrel=1
pkgdesc="Unity Version Control (formerly Plastic SCM) originally developed by Códice Software (Command line utilities)"
arch=('x86_64')
url="https://www.plasticscm.com/plastic-for-linux"
license=('LicenseRef-UnityVersionControl')
depends=('e2fsprogs' 'gcc-libs' 'glibc' 'icu' 'keyutils' 'krb5>=1.10.' 'lttng-ust' 'zlib>=1.1.4')
groups=('plasticscm-complete' 'plasticscm-client-complete')
options=('!strip') # stripping seems to break the cm binary
source=("https://plastic-releases.s3.eu-west-2.amazonaws.com/releases/${pkgver}/plasticscm/linux/PlasticSCM-${pkgver}-linux-client-core.tar.gz")
b2sums=('3bfff60532ead85c9cbb0362eea7d87c1ed406d8da744563e09294fc140798e56869eaac2641acad12a1ba6e6cb89d2dea5b286d74d947ec41eab63a495ad1a9')

package() {
    local -r plasticdir="/opt/plasticscm5"

    # create directories
    install -d "${pkgdir}${plasticdir}/" "${pkgdir}/usr/bin/"

    # copy files
    cp -r "${srcdir}/client/" "${pkgdir}${plasticdir}/"

    # set permissions
    chmod 775 "${pkgdir}${plasticdir}/client/cm"

    # create symlinks
    ln -s "${plasticdir}/client/cm" "${pkgdir}/usr/bin"
}
