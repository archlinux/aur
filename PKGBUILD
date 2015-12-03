pkgname=quartus-lite-max
pkgver=15.1.0.185
pkgrel=1
pkgdesc="MAX II, MAX V device support for Quartus Prime Lite Edition"
arch=('i686' 'x86_64')
url="http://dl.altera.com/?edition=lite#tabs-2"
license=('custom')

_build_nr=$(echo ${pkgver} | cut -d '.' -f4)
_alteradir="/opt/altera"

depends=('quartus-lite')

source=("max-${pkgver}.zip::http://download.altera.com/akdlm/software/acdsinst/${pkgver%.*.*}/${_build_nr}/ib_installers/max-${pkgver}.qdz" )
md5sums=('deacb97d4a14a952521b6f1dfbcb958f')
options=('!strip' '!upx') # No need for device support
PKGEXT=".pkg.tar" # Do not compress

package() {
    cd "${srcdir}"

    # Use mv instead of install/cp to save I/O in case of big device support packages
    install -d -m755 "${pkgdir}/${_alteradir}/"
    mv ${srcdir}/quartus "${pkgdir}/${_alteradir}/"

    # Fix permissions
    cd "${pkgdir}/${_alteradir}"
    chmod -R u+w ./
}

# vim:set ts=2 sw=2 et:
