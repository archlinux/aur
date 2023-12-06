# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=windowmanager
pkgname=wayfire-plugins-toplevel-manager
pkgver=0.8.0
pkgrel=1
pkgdesc="A general window management protocol, and its implementation for Wayfire in the form of wayfire plugin"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/wayfireplugins/${_pkgname}"
license=('MIT')
depends=('wayfire' 'wlroots' 'wayland')
makedepends=('meson' 'ninja' 'glm')
source=("https://gitlab.com/wayfireplugins/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('bee49efa44c7d653c75d891dca1ac25a')

build() {
  cd "${_pkgname}-v${pkgver}"
  PKG_CONFIG_PATH=/usr/lib/wlroots0.16/pkgconfig meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

