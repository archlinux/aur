# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=yzis-git
pkgver=r2905.7807cb8e
pkgrel=1
pkgdesc='Vi-like editor with frontends for Qt5 and NCurses'
arch=('i686' 'x86_64')
url='https://github.com/sandsmark/yzis'
license=('LGPL' 'GPL')
depends=('qt5-base' 'qt5-xmlpatterns' 'lua51' 'ncurses' 'gettext' 'perl')
makedepends=('cmake' 'git' 'doxygen')
conflicts=(yzis)
provides=(yzis)
source=('git+https://github.com/sandsmark/yzis.git')
md5sums=('SKIP')

pkgver() {
  cd yzis
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
    cd build
    cmake ../yzis \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_NYZIS=True \
        -DENABLE_QYZIS=True \
        -DENABLE_KYZIS=False \
        -DENABLE_KPART_YZIS=False \
        -DENABLE_LIBYZISRUNNER=False \
        -DENABLE_TESTS=False \
        -DENABLE_X_IN_NYZIS=False \
        -DENABLE_SAFE_MODE=True \

    make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
