# Maintainer: Fell <fell@fellr.net>

pkgname=plasticscm-client-core
pkgver=11.0.16.9546
pkgrel=1
pkgdesc="Unity Version Control (formerly Plastic SCM) originally developed by Códice Software (Command line utilities)"
arch=('x86_64')
url="https://www.plasticscm.com/plastic-for-linux"
license=('LicenseRef-UnityVersionControl')
depends=('e2fsprogs' 'gcc-libs' 'glibc' 'icu' 'keyutils' 'krb5' 'lttng-ust' 'zlib')
groups=('plasticscm-complete' 'plasticscm-client-complete')
options=('!strip') # stripping seems to break the cm binary
source=("https://plastic-releases.s3.eu-west-2.amazonaws.com/releases/${pkgver}/plasticscm/linux/PlasticSCM-${pkgver}-linux-client-core.tar.gz")
b2sums=('4c4c5aa3e24d5ed361edc3a75401ba9ae6a173dc4b0a32bd2e1ec612a9531dc69cc3b4a58731d1b385de47f801e352fb92c06ad553b4b91034b0a4ce0528eff6')

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
