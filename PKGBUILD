# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=dbusqt
pkgname=wayfire-plugins-dbusqt
pkgver=0.8.0
pkgrel=3
pkgdesc="Wayfire plugin to expose a few internal features via DBus. This plugin is a temporary waypoint until protocols are developed to cater to all the needs"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/wayfireplugins/${_pkgname}"
license=('MIT')
makedepends=('meson' 'ninja' 'glm' 'wayfire' 'qt5-base' 'libdbusmenu-qt5')
source=("https://gitlab.com/wayfireplugins/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz"
        "glm.pc")
md5sums=('e6776eafd520529b59baa547942022fc'
         'cf8952ce9d967c38d5bc21b8888ce07d')

build() {
  cd "${_pkgname}-v${pkgver}"
  PKG_CONFIG_PATH=/usr/lib/wlroots0.16/pkgconfig:$srcdir meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build

}

package() {
  depends=('wayfire' 'qt5-base' 'libdbusmenu-qt5')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
