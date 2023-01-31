# Git version of the official package
# Maintainer: VicSanRoPe <vicsanrope@protonmail.com>
# PKGBUILD from the official package
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=ksanecore-git
_pkgname=ksanecore
pkgver=r673.9bb5b42
pkgrel=1
pkgdesc='Library providing logic to interface scanners (git version)'
url='https://www.kde.org/'
arch=(x86_64)
license=(GPL LGPL FDL)
depends=(ki18n sane)
makedepends=(git extra-cmake-modules)
provides=('ksanecore')
conflicts=('ksanecore')
source=('ksanecore::git+https://invent.kde.org/libraries/ksanecore.git')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S $_pkgname -DBUILD_TESTING=OFF -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
