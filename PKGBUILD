# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>
# Maintainer: Jens Staal <staal1978@gmail.com>

# Adopted from kimap-git
# Antonio Rojas <arojas@archlinux.org>


pkgname=kimap2-git
pkgver=r765.df01ac2
pkgrel=1
pkgdesc="Job-based API for interacting with IMAP servers"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/kde/pim/kimap2"
license=('LGPL')
depends=('kmime')
makedepends=('extra-cmake-modules' 'git' 'python' 'boost')

source=("git://anongit.kde.org/kimap2.git")
md5sums=('SKIP')

pkgver() {
  cd kimap2
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kimap2 \
    -DENABLE_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
} 
