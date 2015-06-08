# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=udev-notify-bzr
pkgver=32
pkgrel=1
pkgdesc="Visual hardware notifications for Linux. (Bazaar version)"
arch=('i686' 'x86_64')
url="https://launchpad.net/udev-notify"
license=('GPL3')
depends=('notification-daemon' 'python2' 'python2-udev' 'python2-notify')
makedepends=('bzr')
conflicts=('udev-notify')
provides=('udev-notify')
source=('udev-notify::bzr+lp:udev-notify')
sha1sums=('SKIP')

pkgver() {
  cd udev-notify
  echo "$(bzr revno)"
}

prepare() {
  # Prepare Makefile
  sed -e 11d -e '/debian-package.sh/d' -e '/pyudev/d' -e 's|\./build/debian|$(DESTDIR)|g' -i udev-notify/Makefile
  # Force use python2
  sed 's|env python|env python2|g' -i udev-notify/src/udev-notify.py
}

package() {
  make -C udev-notify DESTDIR="${pkgdir}"
}
