# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kmediaplayer
pkgver=5.102.0
pkgrel=1
pkgdesc='Plugin interface for media player features'
arch=('x86_64')
url='https://invent.kde.org/frameworks/kmediaplayer'
license=('LGPL')
depends=('kparts')
makedepends=('extra-cmake-modules')
groups=('kf5-aids')
source=("https://invent.kde.org/frameworks/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('41d6a924a9f2d9d73038c9e523aadf5609b2f9c76a5cbc3967cc927f5714cdc8')

_srcdir="$pkgname-v$pkgver"

build() {
  cmake -B build -S "${_srcdir}" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dpm644 "${_srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
