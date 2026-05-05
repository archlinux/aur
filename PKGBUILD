# Maintainer: Fell <fell@fellr.net>

pkgname=plasticscm-client-core
pkgver=11.0.16.10042
pkgrel=1
pkgdesc="Unity Version Control (formerly Plastic SCM) originally developed by Códice Software (Command line utilities)"
arch=('x86_64')
url="https://www.plasticscm.com/plastic-for-linux"
license=('LicenseRef-UnityVersionControl')
depends=('e2fsprogs' 'gcc-libs' 'glibc' 'icu' 'keyutils' 'krb5' 'lttng-ust' 'zlib')
groups=('plasticscm-complete' 'plasticscm-client-complete')
options=('!strip') # stripping seems to break the cm binary
source=("https://plastic-releases.s3.eu-west-2.amazonaws.com/releases/${pkgver}/plasticscm/linux/PlasticSCM-${pkgver}-linux-client-core.tar.gz")
b2sums=('a196140f0a6a787caa6cf70b4abc1f256a5ec0eb451c5890253cc5dfdea08d498822f1fb1c10350ff179b5f20257eee091edeefcfdc44edb3e45fa4fb6917099')

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
