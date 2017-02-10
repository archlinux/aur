# Maintainer: lemust83 <lemust83420@gmail.com>
# Contributor: Micael Capitão <mjpcapitao@gmail.com>
# Contributor: igordcard <igordcard@gmail.com>
# Contributor: Pascal E. <archlinux at hardfalcon dot net>
pkgname="acsccid"
pkgver="1.1.4"
pkgrel=1
pkgdesc="a PC/SC driver for Linux/Mac OS X and it supports ACS CCID smart card readers. This library provides a PC/SC IFD handler implementation and communicates with the readers through the PC/SC Lite resource manager (pcscd)."
arch=('i686' 'x86_64')
url="http://acsccid.sourceforge.net/"
license=('LGPL2.1')
depends=('pcsclite>=1.8.3' 'libusb-compat>=0.1.4')
makedepends=('pcsclite>=1.8.3' 'libusb-compat>=0.1.4' 'flex' 'pkg-config')
source=("https://downloads.sourceforge.net/acsccid/acsccid-${pkgver}.tar.bz2")
sha256sums=('1607591ee0df07c0157a71f6cb61e1e11fe1fa17331f02d2dff020db0e28c0ae')

build()
{
    cd "${srcdir}/${pkgname}-${pkgver}" || return 1
    ./configure --prefix=/usr || return 1
    make || return 1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return 1
    sed -i '/$(INSTALL_UDEV_RULE_FILE)/ c\' src/Makefile || return 1
    make DESTDIR="${pkgdir}" install || return 1
    install -Dm644 src/92_pcscd_acsccid.rules "$pkgdir/etc/udev/rules.d/92_pcscd_acsccid.rules" || return 1
    install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS" || return 1
    install -Dm644 ChangeLog "$pkgdir/usr/share/licenses/$pkgname/ChangeLog" || return 1
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING" || return 1
    install -Dm644 INSTALL "$pkgdir/usr/share/licenses/$pkgname/INSTALL" || return 1
    install -Dm644 NEWS "$pkgdir/usr/share/licenses/$pkgname/NEWS" || return 1
    install -Dm644 README "$pkgdir/usr/share/licenses/$pkgname/README" || return 1
}
