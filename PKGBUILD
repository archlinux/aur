# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=kcolorscheme-git
_pkgname=kcolorscheme
pkgver=6.27.0.r3.gc6e7622
pkgrel=1
pkgdesc='Classes to read and interact with KColorScheme'
arch=(any)
url='https://invent.kde.org/frameworks/kcolorscheme'
license=(LGPL)
depends=(qt6-base kconfig-git kguiaddons-git ki18n-git)
makedepends=(git extra-cmake-modules-git doxygen qt6-tools)
conflicts=($_pkgname)
provides=($_pkgname)
groups=(kf6-git)
source=("git+https://invent.kde.org/frameworks/kcolorscheme.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
