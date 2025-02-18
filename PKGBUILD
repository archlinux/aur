# Maintainer: Fell <fell@fellr.net>

pkgname=plasticscm-client-core
pkgver=11.0.16.7134
pkgrel=2
pkgdesc="Unity Version Control (formerly Plastic SCM) originally developed by Códice Software (Command line utilities)"
arch=('x86_64')
url="https://www.plasticscm.com/plastic-for-linux"
license=('LicenseRef-UnityVersionControl')
depends=('icu' 'krb5>=1.10.' 'lttng-ust' 'zlib>=1.1.4') # according to debian package
groups=('plasticscm-complete' 'plasticscm-client-complete')
options=('!strip') # stripping seems to break the cm binary
source=("https://plastic-releases.s3.eu-west-2.amazonaws.com/releases/${pkgver}/plasticscm/linux/PlasticSCM-${pkgver}-linux-client-core.tar.gz")
b2sums=('d645718f92064186bafb7373110ec118d2b550345a0caf0250fe13ca3df52430ec563a2cb9f9ea1ec4b854ee3780dd21fe181610d471e54fbad26b0b78cf6fcf')

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
