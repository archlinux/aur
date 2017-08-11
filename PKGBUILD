# Maintainer: Gancho Manev <gmanev@designer.bg>
pkgname=xerox-workcentre-5845-5855
pkgver=5.482.0.0
pkgrel=1
pkgdesc="Xerox WorkCentre 5845/5855 printer driver for CUPS"
arch=("x86_64")
url="http://www.support.xerox.com/support/workcentre-5845-5855"
source=("http://download.support.xerox.com/pub/drivers/WC58XA/drivers/win10/en_GB/WC58XX_${pkgver}_PPD_English.exe")
license=('custom')
sha512sums=('b965a5131f6e655e9c2229071c73b575e58ae9b3f2e2284511f6b5cea8c492c754366c007d69ae34ba87d405bedb3e54847619a877901262da57b177cdb37d2d')
makedepends=('unrar')
depends=('libcups')

prepare() {
    cd ${srcdir}
    unrar e -y WC58XX_${pkgver}_PPD_English.exe *.ppd
}

package() {
    _targetdir=${pkgdir}/usr/share/foomatic/db/source/PPD/Xerox
    cd ${srcdir}
    install -d --mode=755 "${_targetdir}"
    install --mode=644 --target-directory="${_targetdir}" *.ppd
}
