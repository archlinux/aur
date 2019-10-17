# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=system76-firmware-daemon
_pkgname=system76-firmware
pkgver=1.0.6
pkgrel=1
pkgdesc='System76 Firmware Daemon provides a daemon for installing firmware updates.'
arch=('x86_64')
url='https://github.com/pop-os/system76-firmware'
license=('GPL3')
install="${pkgname}.install"
depends=(
  'ca-certificates'
  'dbus'
  'dfu-programmer'
  'systemd'
  'openssl'
  'xz'
)
makedepends=('rust')
conflicts=('system76-driver<=17.10.32')
source=("https://github.com/pop-os/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('854d2d87b30beda90bd1fd5f1fea2096d2a82289c86ae727ecda714310d818c9')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make prefix=/usr DESTDIR="${pkgdir}"
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make prefix=/usr DESTDIR="${pkgdir}" install-daemon
}
