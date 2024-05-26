# Maintainer: VicSanRoPe <kde.sp90x@simplelogin.com>

pkgname=ksanecore-git
pkgver=v24.01.90.r20.gf2f2dfa
pkgrel=1
pkgdesc='Library that provides a Qt interface for the SANE library for scanner hardware (git version)'
url='https://invent.kde.org/libraries/ksanecore'
arch=(x86_64)
license=(LGPL)
depends=(ki18n sane)
makedepends=(git extra-cmake-modules)
provides=('ksanecore')
conflicts=('ksanecore')
source=('ksanecore::git+https://invent.kde.org/libraries/ksanecore.git')
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${pkgname%-git}" -DQT_MAJOR_VERSION=6 -DBUILD_TESTING=OFF -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
