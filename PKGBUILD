# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## dfl-login1 -> dfl-wayqt -> dfl-gamma-effects - dfl-power

_pkgname=power
pkgname=dfl-power
pkgver=0.1.0
pkgrel=1
pkgdesc="A class to handle various display effects that can be performed using wlr-gamma-control protocol"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'upower' 'dfl-wayqt' 'dfl-gamma-effects' 'dfl-login1')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('daa7acb760210228ab21ba97584b6073')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
