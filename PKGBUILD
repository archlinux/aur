# Maintainer: Joey Miller <maintainer at joeeey dot com>

pkgname=eversticky
pkgver=0.95.0
pkgrel=1
pkgdesc="A sticky note client that sync to Evernote."
arch=('x86_64')
url="https://eversticky.joeeey.com"
license=('GPL3' 'MIT')
depends=("qt5-webengine>=5.12.2" "qt5-x11extras>=5.12.2" )
conflicts=("eversticky")
replaces=("eversticky")
source=("https://github.com/itsmejoeeey/eversticky/releases/download/v${pkgver}/${pkgname}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('fa14a88e01c8e640b0b44867d942ce160aaa290a96c65642c833f58d907ae982')

package() {
    echo "  -> Extracting the installer..."

    # Extract binary and icons from data.tar.xz
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    # Extract license information from control.tar.xz
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    bsdtar -xf control.tar.xz -C "${pkgdir}/usr/share/licenses/${pkgname}" ./copyright
    mv "${pkgdir}/usr/share/licenses/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix permissions
    find "${pkgdir}" -type d -exec chmod 755 {} \; 
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
