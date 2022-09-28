# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## dfl-login1 -> dfl-wayqt -> dfl-gamma-effects - dfl-power

_pkgname=power
pkgname=dfl-power
pkgver=0.1.0alpha1
pkgrel=1
pkgdesc="A class to handle various display effects that can be performed using wlr-gamma-control protocol"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'upower' 'dfl-wayqt' 'dfl-gamma-effects' 'dfl-login1')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/alpha1/-alpha1}/${_pkgname}-v${pkgver/alpha1/-alpha1}.tar.gz")
md5sums=('a2ab73f3a11966977ef14ba08f851589')

build() {
  cd "${_pkgname}-v${pkgver/alpha1/-alpha1}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/alpha1/-alpha1}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
