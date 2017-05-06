# Maintainer: Jeremy Symon <jtsymon@gmail.com>
pkgname=dale-git
_gitname=dale
pkgver=r1040.24457a1
pkgrel=1
pkgdesc='Lisp-flavoured C'
url='https://github.com/tomhrr/dale/'
arch=('x86_64' 'i686')
license=('BSD')
depends=('libffi' 'zlib' 'gcc-libs-multilib' 'ncurses')
makedepends=('git' 'cmake' 'pkg-config' 'llvm35')
provides=('dale')
source=(
  "git+https://github.com/tomhrr/${_gitname}.git"
)
sha512sums=(
  'SKIP'
)

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p build
  cd build
  cmake ../$_gitname -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_MANDIR=/usr/share/man
  make
}

check() {
  cd build
  make tests
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  cd ../$_gitname
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
