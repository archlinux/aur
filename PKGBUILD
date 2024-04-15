# Maintainer: Brody <archfan at brodix dot de>

_pkgname=oversteer
pkgname=${_pkgname}-git
pkgver=0.8.1.r9.gdd87ec3
pkgrel=1
pkgdesc='Graphical application to configure Logitech Wheels'
arch=(any)
url=https://github.com/berarma/oversteer
license=(GPL3)
depends=(
  appstream-glib
  desktop-file-utils
  gettext
  python
  python-cairo
  python-evdev
  python-gobject
  python-matplotlib
  python-pyudev
  python-scipy
  python-pyxdg
)
makedepends=(
  git
  meson
)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(git+https://github.com/berarma/${_pkgname}.git)
sha256sums=(SKIP)

pkgver() {
  cd ${_pkgname}
  git describe --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd ${_pkgname}
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
