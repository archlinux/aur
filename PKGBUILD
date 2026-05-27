# Maintainer: Fell <fell@fellr.net>

pkgname=plasticscm-client-core
pkgver=11.0.16.10181
pkgrel=1
pkgdesc="Unity Version Control (formerly Plastic SCM) originally developed by Códice Software (Command line utilities)"
arch=('x86_64')
url="https://www.plasticscm.com/plastic-for-linux"
license=('LicenseRef-UnityVersionControl')
depends=('e2fsprogs' 'gcc-libs' 'glibc' 'icu' 'keyutils' 'krb5' 'lttng-ust' 'zlib')
groups=('plasticscm-complete' 'plasticscm-client-complete')
options=('!strip') # stripping seems to break the cm binary
source=("https://plastic-releases.s3.eu-west-2.amazonaws.com/releases/${pkgver}/plasticscm/linux/PlasticSCM-${pkgver}-linux-client-core.tar.gz")
b2sums=('9b36989718c0c27a02958db5b06db248099336e7a24bbb634f8b974bce482b9d8863bafdecf67bb6e916ddb3d2f23a8f8619e4a448ff25e69eccf5d08542124e')

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
