# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
pkgname=ktexteditor-git
pkgver=r2378.71b4295a
pkgrel=1
pkgdesc='KTextEditor framework'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/frameworks/ktexteditor'
license=(LGPL)
depends=(kparts-git libgit2)
makedepends=(extra-cmake-modules-git git)
provides=(ktexteditor)
conflicts=(ktexteditor)
source=('git+https://github.com/KDE/ktexteditor.git')
md5sums=('SKIP')

pkgver() {
  cd ktexteditor
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ktexteditor \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
