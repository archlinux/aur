# Maintainer: Klimenko Maxim <klimenkomaximsergievich@gmail.com>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=udev-notify-bzr
pkgver=42
pkgrel=1
pkgdesc="Visual hardware notifications for Linux. (Bazaar version)"
arch=('i686' 'x86_64')
url="https://launchpad.net/udev-notify"
license=('GPL3')
depends=('libnotify' 'udev' 'python-notify2' 'python-pyudev')
makedepends=('bzr')
source=('python3::bzr+lp:~i026e/udev-notify/python3')
sha1sums=('SKIP')
conflicts=('udev-notify-bzr')
provides=('udev-notify-bzr')

_bzrmod="python3"

pkgver() {
  cd "${_bzrmod}"
  printf "%s" "${pkgver}"
}

prepare() {
  cd "${_bzrmod}"

  # Prepare Makefile
  sed -e 11d -e '/debian-package.sh/d' -e '/pyudev/d' -e 's|\./build/debian|$(DESTDIR)|g' -i Makefile
}

package() {
  make -C "${_bzrmod}" DESTDIR="${pkgdir}"
}
