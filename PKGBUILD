# Maintainer: Ken Hasselmann <arch AT kenh DOT fr>

pkgname=argos3-epuck-git
_gitname=argos3-epuck
pkgver=r12.fe0e358
pkgrel=1

pkgdesc="ARGoS3 simulator library for epuck robot"
arch=('i686' 'x86_64')
url="https://github.com/lgarattoni/argos3-epuck"
license=('MIT')

depends=('argos3-git')
makedepends=('gcc>=4.4' 'git' 'cmake>=2.8')

source=('git://github.com/lgarattoni/argos3-epuck.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the revision number
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  mkdir build_simulator
  cd build_simulator
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../src
  make
}

package() {
  cd "$srcdir/$_gitname"
  cd build_simulator
  make DESTDIR="$pkgdir/" install
}

