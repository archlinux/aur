# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=system76-firmware-daemon
_pkgname=system76-firmware
pkgver=1.0.13
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
sha256sums=('306259e857d2501cf0a21966f7f856b93e6b1324622c571285c07af7f2de6dfa')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make prefix=/usr DESTDIR="${pkgdir}"
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make prefix=/usr DESTDIR="${pkgdir}" install-daemon
}
