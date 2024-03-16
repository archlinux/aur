# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=windowmanager
pkgname=wayfire-plugins-toplevel-manager
pkgver=0.8.0
pkgrel=3
pkgdesc="A general window management protocol, and its implementation for Wayfire in the form of wayfire plugin"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/wayfireplugins/${_pkgname}"
license=('MIT')
depends=('wayfire' 'wayland')
makedepends=('meson' 'ninja' 'glm')
source=("https://gitlab.com/wayfireplugins/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz"
        "https://gitlab.com/wayfireplugins/windowmanager/-/commit/0bf81a1d1af06f624722325148d6d8f7d3dcf260.patch")
md5sums=('bee49efa44c7d653c75d891dca1ac25a'
         '1ccdefa3f69e44304c411ca0c5ba59f0')

prepare() {
  cd "${_pkgname}-v${pkgver}"
  patch -Np1 -i ../0bf81a1d1af06f624722325148d6d8f7d3dcf260.patch #Fix compilation against wlroots 0.17
}

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

