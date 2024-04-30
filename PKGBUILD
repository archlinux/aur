# Maintainer: Brody <archfan at brodix dot de>

_pkgname=oversteer
pkgname=${_pkgname}-git
pkgver=0.8.2.r0.g4c7062e
pkgrel=1
pkgdesc='Graphical application to configure Logitech Wheels'
arch=(any)
url=https://github.com/berarma/${_pkgname}
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
  python-pyxdg
  python-scipy
)
makedepends=(
  git
  meson
)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(${_pkgname}::git+${url}.git#branch=v0.8.x)
b2sums=(SKIP)

pkgver() {
  cd ${_pkgname}
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  sed -i "s|version: '0.8.1',|version: '0.8.2',|g" meson.build
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
