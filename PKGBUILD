# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kio-git
pkgver=r1598.8b43a9e
pkgrel=1
pkgdesc='Resource and network access abstraction'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kio'
license=('LGPL')
depends=('karchive-git' 'kbookmarks-git' 'kjobwidgets-git' 'kwallet-git' 'solid-git' 'libxslt' 'desktop-file-utils')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools')
groups=('kf5')
conflicts=(kio)
provides=(kio)
install=$pkgname.install
source=('git://anongit.kde.org/kio.git')
md5sums=('SKIP')

pkgver() {
  cd kio
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kio \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
