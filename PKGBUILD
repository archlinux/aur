# Maintainer: Aleix Pol Gonzalez <aleixpol@kde.org>

pkgname=kirigami-git
pkgver=r404.1ae53b2
pkgrel=1
pkgdesc='A set of QML components for mobile/desktop convergent applications made by KDE'
arch=('i686' 'x86_64')
url='https://quickgit.kde.org/?p=kirigami.git'
license=(LGPL)
depends=(qt5-base)
makedepends=(extra-cmake-modules git)
source=('git://anongit.kde.org/kirigami.git')
groups=(plasma)
md5sums=('SKIP')

pkgver() {
  cd kirigami
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kirigami \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
