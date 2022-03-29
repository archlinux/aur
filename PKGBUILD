# Maintainer: Petr Cizmar <xr_0322@xpc.ovh>
pkgname=ctzcls-cups
pkgver=1.5
pkgrel=1
pkgdesc="Citizen Sticker Printers driver for CUPS"
arch=('x86_64')
url="https://www.citizen-systems.co.jp/en/printer/download/driver-cups-source/"
license=('GPL2')
depends=('cups')
makedepends=('libcups')
source=("cups-ctzcls-${pkgver}.tar.bz2::https://www.citizen-systems.co.jp/en/printer/download/driver-cups-source/cups-ctzcls.tar.bz2")
sha256sums=('d3fe19aa253044c383df3a3869c9dac88b0ced374fe42eb24aabfe6a1ff72ff4')

build() {
   cd "${srcdir}"
   gcc $CFLAGS -fPIC -o rastertocls rastertocls.c -lcupsimage -lcups
}

package() {
   install -Dm 644 "${srcdir}"/ctzcls.ppd -t "${pkgdir}"/usr/share/cups/model/
   install -Dm 755 "${srcdir}"/rastertocls -t "${pkgdir}"/usr/lib/cups/filter/
echo
}
