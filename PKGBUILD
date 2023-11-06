# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>
pkgname=ruqola-better-git
_pkgname=ruqola
pkgver=2.0.0.r428.ga24aeb5
pkgrel=1
pkgdesc='Rocket.Chat client for the KDE desktop'
arch=('x86_64')
url='https://invent.kde.org/network/ruqola'
license=('LGPL2.1')
depends=(
  # qt5 group
 'qt5-websockets' 'qt5-networkauth' 'qt5-multimedia'
 # kf5 group
 'kwidgetsaddons5' 'ki18n5' 'kcrash5' 'kcoreaddons5' 'syntax-highlighting5' 'sonnet5' 'ktextwidgets5' 'knotifyconfig5' 'kio5' 'kiconthemes5' 'kxmlgui5' 'kidletime5' 'prison5' 'kdoctools5'
 # others
 'qtkeychain-qt5' 'hicolor-icon-theme' 'kuserfeedback5' 'ktextaddons'
)
makedepends=('cmake' 'extra-cmake-modules' 'git')
provides=(ruqola)
conflicts=(ruqola)
source=("git+https://invent.kde.org/network/$_pkgname.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../$_pkgname" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build .
}

package() {
  cd build
  DESTDIR="$pkgdir" cmake --install .
}
