# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# based off the quartus-lite-max PKGBUILD by swiftgeek
pkgname=quartus-lite-cyclonev
pkgver=18.1.0.625
pkgrel=1
pkgdesc="Cyclone V device support for Quartus Prime Lite Edition"
arch=('i686' 'x86_64')
url="http://dl.altera.com/?edition=lite#tabs-2"
license=('custom')

_build_nr=$(echo ${pkgver} | cut -d '.' -f4)
_alteradir="/opt/altera"

depends=('quartus-lite')

source=("cyclonev-${pkgver}.zip::http://download.altera.com/akdlm/software/acdsinst/${pkgver%.*.*}std/${_build_nr}/ib_installers/cyclonev-${pkgver}.qdz" )
md5sums=('75F5029A9058F64F969496B016EE19D4')
options=('!strip') # No need for device support
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
