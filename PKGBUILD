# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kdepimlibs-git
pkgver=r18953.019b5e8
pkgrel=1
pkgdesc="KDE PIM Libraries"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdepimlibs'
license=('GPL' 'LGPL')
depends=('akonadi-git' 'kcalcore-git' 'kldap-git' 'kmbox-git' 'kcontacts-git' 'prison-frameworks-git')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools' 'python' 'boost')
conflicts=('kdepimlibs')
install=$pkgname.install
source=('git://anongit.kde.org/kdepimlibs.git')
md5sums=('SKIP')

pkgver() {
  cd kdepimlibs
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdepimlibs \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTS=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
