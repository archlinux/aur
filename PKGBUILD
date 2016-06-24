# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=kpackage-git
pkgver=r198.09e0ac7
pkgrel=2
pkgdesc="Framework that lets applications manage user installable packages of non-binary assets"
arch=(i686 x86_64)
url="https://projects.kde.org/projects/frameworks/kpackage"
license=(LGPL)
depends=(qt5-base karchive-git ki18n-git kcoreaddons-git kconfig-git)
makedepends=(extra-cmake-modules-git git qt5-tools python kdoctools-git)
groups=(kf5)
conflicts=(kpackage)
provides=(kpackage)
source=("git://anongit.kde.org/kpackage.git")
md5sums=('SKIP')

pkgver() {
  cd kpackage
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kpackage \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
