# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kfilemetadata-git
pkgver=r239.b95e10c
pkgrel=1
pkgdesc="A library for extracting file metadata"
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/kdelibs/kfilemetadata'
license=(LGPL)
depends=(ki18n-git karchive-git exiv2 poppler-qt5 taglib ffmpeg ebook-tools)
makedepends=(extra-cmake-modules git)
provides=(kfilemetadata)
conflicts=(kfilemetadata)
source=('git://anongit.kde.org/kfilemetadata.git')
md5sums=('SKIP')

pkgver() {
  cd kfilemetadata
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kfilemetadata \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DLIB_INSTALL_DIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
