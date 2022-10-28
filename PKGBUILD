# Maintainer: amateurece <ethan.twardy at gmail dot com>

pkgname=phosphor-dbus-interfaces-git
_pkgname=${pkgname%%-git}
pkgver=r581.b78a0704
pkgrel=2
pkgdesc="YAML descriptors of standard dbus interfaces (in OpenBMC)"
url="https://github.com/openbmc/phosphor-dbus-interfaces"
arch=('i686' 'x86_64' 'aarch64')
license=('Apache')
depends=('sdbusplus-git')
makedepends=('git' 'meson')
source=("${pkgname}::git+https://github.com/openbmc/${_pkgname}.git")
sha256sums=('SKIP')

_meson_setup() {
    arch-meson "${pkgname}" build
}

prepare() {
    _meson_setup
}

pkgver() {
    cd "${pkgname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    _meson_setup
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
