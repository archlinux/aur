# Maintainer: Michał Lisowski <lisu@riseup.net>

pkgname=maszyna-git
pkgver=r1277.c45081b2
pkgrel=1
pkgdesc="Polish train simulator"
arch=('x86_64')
url="https://eu07.pl/"
license=('MPL2')
makedepends=('cmake' 'git' 'glfw' 'glm' 'libserialport')
source=("$pkgname"::'git://github.com/eu07/maszyna.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
}

build() {
  cd "$srcdir/$pkgname"
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 build/bin/eu07_$(date +'%y%m%d') "${pkgdir}/usr/bin/maszyna"
}
