# Maintainer: Nafis <mnabid.25@outlook.com>
# Contributor: Bernie Innocenti <bernie@codewiz.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=plasma-thunderbolt
pkgname=${_pkgname}-git
pkgver=5.22.90.r18.d4afb3d
pkgrel=1
pkgdesc='Plasma integration for controlling Thunderbolt devices'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
groups=(plasma)
depends=(bolt systemsettings)
makedepends=(git extra-cmake-modules)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+https://invent.kde.org/plasma/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  echo "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cmake -B build -S ${_pkgname} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR=${pkgdir} cmake --install build
}
