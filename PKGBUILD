# Maintainer: VicSanRoPe <kde.sp90x@simplelogin.com>

pkgname=ksanecore-git
pkgver=r716.5c6654f
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
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "${pkgname%-git}" -DBUILD_TESTING=OFF -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
