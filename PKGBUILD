# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=qt-shell
pkgname=wayfire-plugins-qtshell
pkgver=0.8.0.1
pkgrel=3
pkgdesc="Implementation of qt-shell protocol for Wayfire in the form of wayfire plugin"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/wayfireplugins/${_pkgname}"
license=('MIT')
depends=('wayfire')
makedepends=('meson' 'ninja' 'glm')
source=("https://gitlab.com/wayfireplugins/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz"
        "https://gitlab.com/wayfireplugins/qt-shell/-/commit/3a6fb99f64f20b31bce3494a487fd46d9e23bb47.patch")
md5sums=('7222f3368874f06e54b622e503764c21'
         '1a5c40f30489028abb7c4bed9f80768f')

prepare() {
  cd "${_pkgname}-v${pkgver}"
  patch -Np1 -i ../3a6fb99f64f20b31bce3494a487fd46d9e23bb47.patch #fix compilation against wlroots 0.17
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

