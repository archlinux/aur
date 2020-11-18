# Maintainer: zanny <lordzanny@gmail.com>
# Maintainer: Aleix Pol Gonzalez <aleixpol@kde.org>

pkgname=kirigami-git
_name=${pkgname%-git}
pkgver=v2.2.0.r1515.g07876274
pkgrel=1
pkgdesc='A set of QML components for mobile/desktop convergent applications made by KDE'
arch=('i686' 'x86_64')
url='https://quickgit.kde.org/?p=kirigami.git'
license=(LGPL)
depends=(qt5-quickcontrols2 qt5-graphicaleffects)
makedepends=(extra-cmake-modules git qt5-svg)
conflicts=(kirigami2)
provides=(kirigami2)
groups=(plasma)
source=("git+https://invent.kde.org/frameworks/$_name.git")
md5sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_name
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
