# Maintainer: Konstantin Shurukhin <kshurukhin (at)gmail(dot)com>

pkgname=rtw89bt-dkms-git
pkgver=5.15.0.r30.g6ff07d1
pkgrel=1
pkgdesc="Out-of-kernel driver for Realtek BT devices found in rtw89 devices (8852AE, RTW8852BE, RTW8852CE). Kernel >= 5.15.0"
arch=('i686' 'x86_64')
url="https://github.com/lwfinger/rtw89-BT"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=("${pkgname}")
source=("git+https://github.com/lwfinger/rtw89-BT.git")
sha256sums=('SKIP')
pkgver() {
    cd ${srcdir}/rtw89-BT
    printf '%s.r%s.g%s' '5.15.0' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/rtw89-BT
    mkdir -p ${pkgdir}/usr/src/${pkgname}-${pkgver}
    cp -pr * ${pkgdir}/usr/src/${pkgname}-${pkgver}
    cp ${srcdir}/rtw89-BT/debian/rtw89bt-dkms.dkms ${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf
}
