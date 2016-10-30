pkgname=quartus-lite-cyclone
pkgver=16.0.0.211
pkgrel=1
pkgdesc="Cyclone IV device support for Quartus Prime Lite Edition"
arch=('i686' 'x86_64')
url="http://dl.altera.com/?edition=lite#tabs-2"
license=('custom')

_build_nr=$(echo ${pkgver} | cut -d '.' -f4)
_alteradir="/opt/altera"

depends=('quartus-lite')

source=("cyclone-${pkgver}.zip::http://download.altera.com/akdlm/software/acdsinst/${pkgver%.*.*}/${_build_nr}/ib_installers/cyclone-${pkgver}.qdz" )
md5sums=('2c4e5f406114f56e42cb7f25c989a5e2')
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
