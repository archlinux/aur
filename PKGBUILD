# Maintainer: houmain <houmain at posteo dot net>

pkgname=play-dvd-git
_pkgname=play-dvd
pkgver=1
pkgrel=1
pkgdesc="A simple DVD player for Linux based on mpv "
arch=(i686 x86_64 armv6h armv7h aarch64)
url=https://github.com/houmain/${_pkgname}
license=(GPL-3.0-or-later)
depends=(mpv libdvdread)
makedepends=(cmake git)
conflicts=(${_pkgname})
provides=(${_pkgname})
source=(git+https://github.com/houmain/play-dvd.git)
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake . -DVERSION="$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}

# vim: set ts=2 sw=2 et:
