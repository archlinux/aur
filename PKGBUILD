# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=udev-notify-bzr
pkgver=40
pkgrel=1
pkgdesc="Visual hardware notifications for Linux. (Bazaar version)"
arch=('i686' 'x86_64')
url="https://launchpad.net/udev-notify"
license=('GPL3')
depends=('python-pyudev'
         'python-notify2'
         )
makedepends=('bzr')
conflicts=('udev-notify')
provides=('udev-notify')
source=('udev-notify::bzr+lp:~i026e/udev-notify/python3')
sha256sums=('SKIP')

pkgver() {
  cd udev-notify
  echo "$(bzr revno)"
}

prepare() {
  # Prepare Makefile
  sed -e 11d \
      -e '/debian-package.sh/d' \
      -e 's|\./build/debian|$(DESTDIR)|g' \
      -i udev-notify/Makefile
}

package() {
  make -C udev-notify DESTDIR="${pkgdir}"
}
