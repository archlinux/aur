# Maintainer: User8395 <therealuser8395@proton.me?
pkgname=kirigami-addons-git
_pkgname=kirigami-addons
pkgver=1.12.1.r16.g9964c8f
pkgrel=1
pkgdesc="Add-ons for the Kirigami framework (Git version)"
arch=(any)
url="https://invent.kde.org/libraries/kirigami-addons"
license=(GPL-2.0-or-later LGPL-2.1-or-later)
depends=(gcc-libs glibc kcolorscheme-git kconfig-git kcoreaddons-git kcrash-git kglobalaccel-git kguiaddons-git ki18n-git kiconthemes-git kirigami-git kitemmodels-git ksvg-git qt6-base qt6-declarative qt6-multimedia sonnet-git)
makedepends=(git extra-cmake-modules-git)
provides=(kirigami-addons) # this shouldn't be neccessary at all
source=("git+https://invent.kde.org/libraries/kirigami-addons.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
