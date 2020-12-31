# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=system76-firmware-daemon
_pkgname=system76-firmware
pkgver=1.0.21
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
  'efibootmgr'
  'openssl'
  'systemd'
  'xz'
)
makedepends=('rust')
conflicts=('system76-driver<=17.10.32')
source=("https://github.com/pop-os/${_pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.install")
sha256sums=('a1f8bcce8b2e3f7b37f93662292eefa33afc9a01891b684e8518ffd4d97a93e9'
            'bee86280bc6762aa773ef17441126df336abb3f4ca2163caa4df6201b6a2d708')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make prefix=/usr DESTDIR="${pkgdir}"
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make prefix=/usr DESTDIR="${pkgdir}" install
}
