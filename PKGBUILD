# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kimageformats-git
pkgver=r67.6b72930
pkgrel=1
pkgdesc='KImageFormats'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kimageformats'
license=('LGPL')
depends=('qt5-base' 'openexr')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(kimageformats)
provides=(kimageformats)
source=('git://anongit.kde.org/kimageformats.git')
md5sums=('SKIP')

pkgver() {
  cd kimageformats
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kimageformats \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
