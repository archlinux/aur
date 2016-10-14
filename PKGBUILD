
# Maintainer Jens Staal <staal1978@gmail.com>

# Adopted from kimap-git
# Antonio Rojas <arojas@archlinux.org>

_gitname=kimap
pkgname=kimap2-git
pkgver=r730.14ef29d
pkgrel=1
pkgdesc="Job-based API for interacting with IMAP servers"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/kde/pim/$_gitname"
license=('LGPL')
depends=('kmime-git')
makedepends=('extra-cmake-modules-git' 'git' 'python' 'boost')

source=("git://anongit.kde.org/$_gitname.git#branch=dev/kimap2")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname \
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
