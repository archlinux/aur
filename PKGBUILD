# Maintainer: Sander in 't Hout <sander@inthout.eu>

pkgname=atracdenc-git
_gitname=atracdenc
pkgver=r75.218e216
pkgrel=1
pkgdesc='Dirty implementation of ATRAC1, ATRAC3 encoder'
arch=('x86_64')
url=https://github.com/dcherednik/atracdenc
license=('LGPL2.1')
provides=('atracdenc')
depends=('libsndfile')
makedepends=('cmake' 'make' 'git')
source=("atracdenc::git+https://github.com/dcherednik/atracdenc")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_gitname}/src"
  mkdir -p build
  cd build
  cmake ../
  make
}

package() {
  cd "$srcdir/${_gitname}/src/build"
  install -Dt "$pkgdir"/usr/bin atracdenc 
}