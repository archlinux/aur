# Maintainer: amateurece <ethan.twardy at gmail dot com>

pkgname=sdbusplus-git
_pkgname=${pkgname#-git}
pkgver=r598.a8a092c0
pkgrel=1
pkgdesc="C++ bindings for systemd dbus APIs"
url="https://github.com/openbmc/sdbusplus"
arch=('i686' 'x86_64')
license=('Apache')
depends=('systemd-libs' 'python-mako' 'python-inflection' 'python-yaml')
makedepends=('git')
source=("${pkgname}::git+https://github.com/openbmc/sdbusplus.git")
sha256sums=('SKIP')

_meson_setup() {
    arch-meson -Dtests=disabled -Dexamples=disabled "${_pkgname}" build
}

prepare() {
    _meson_setup
}

pkgver() {
  cd "${_pkgname}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    _meson_setup
    meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
