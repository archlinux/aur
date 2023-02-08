# Maintainer: khavlera <khvalera@ukr.net>
# Contributor: Skallwar <estblcsk(at)gmail(dot)com>

pkgname=rtl8821cu-dkms-git
_pkgbase=rtl8821cu
pkgver=5.12.0.69a0c1897
pkgrel=1
pkgdesc="rtl8821cu chipset driver"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/brektrou/rtl8821CU"
license=('GPL2')
depends=('dkms')
makedepends=('git' 'bc')
conflicts=("${_pkgbase}")
source=("git+https://github.com/morrownr/8821cu-20210118#branch=main")
sha256sums=('SKIP')

pkgver() {
   cd ${srcdir}/8821cu-20210118
   printf '%s' '5.12.0.' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd ${srcdir}/8821cu-20210118
   mkdir -p ${pkgdir}/etc/modprobe.d
   mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
   cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
   cp 8821cu.conf ${pkgdir}/etc/modprobe.d
   rm ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/{install,remove}*.sh
}
