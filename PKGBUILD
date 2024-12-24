# Maintainer: Brody <archfan at brodix dot de>

_pkgname=oversteer
pkgname=${_pkgname}-git
pkgver=0.8.3.r7.ga418ffa
pkgrel=2
pkgdesc='Graphical application to configure Logitech Wheels'
arch=(any)
url=https://github.com/berarma/${_pkgname}
license=(GPL-3.0-or-later)
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
  python-pyxdg
  python-scipy
)
makedepends=(
  git
  meson
)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(${_pkgname}::git+${url}.git)
b2sums=(SKIP)

pkgver() {
  cd ${_pkgname}
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
