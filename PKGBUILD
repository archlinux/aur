# Maintainer: Aleix Pol Gonzalez <aleixpol@kde.org>
# Maintainer: zanny <lordzanny@gmail.com>

pkgname=kirigami-git
pkgver=r1320.ed36d6d
pkgrel=1
pkgdesc='A set of QML components for mobile/desktop convergent applications made by KDE'
arch=('i686' 'x86_64')
url='https://quickgit.kde.org/?p=kirigami.git'
license=(LGPL)
depends=(qt5-quickcontrols2)
makedepends=(extra-cmake-modules git)
conflicts=(kirigami2)
provides=(kirigami2)
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
