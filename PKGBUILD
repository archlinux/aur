# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=kglobalacceld-git
_pkgname=kglobalacceld
pkgver=6.6.90.r8.g8475b10
pkgrel=1
pkgdesc='Daemon providing Global Keyboard Shortcut (Accelerator) functionality'
arch=(any)
url='https://invent.kde.org/plasma/kglobalacceld'
license=(LGPL)
depends=(gcc-libs glibc qt6-base kconfig-git kcoreaddons-git kcrash-git kdbusaddons-git kglobalaccel-git kio-git kjobwidgets-git kservice-git kwindowsystem-git libx11 libxcb xcb-util-keysyms)
makedepends=(git extra-cmake-modules-git)
conflicts=(kglobalacceld)
groups=(kf6-git)
source=("git+https://invent.kde.org/plasma/kglobalacceld.git")
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
