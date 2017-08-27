# Maintainer: Shelvacu <aur@shelvacu.com>

_gitname=libserial
pkgname="${_gitname}-git"
pkgver=r148.80e5f25
pkgrel=1
pkgdesc="A library for accessing serial ports on POSIX systems (git version)"
arch=('x86_64')
url="https://github.com/crayzeewulf/${_gitname}/"
license=('GPL2')
makedepends=('git' 'python2-sip')
conflicts=("${_gitname}")
provides=("${_gitname}")
source=("$pkgname"::"git+https://github.com/crayzeewulf/${_gitname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"

  make -f Makefile.dist

  ./configure --prefix=/usr

  cd sip
  python2 configure.py #Workaround from https://github.com/crayzeewulf/libserial/issues/62
  cd ..

  make
}

package() {
  cd "$pkgname"

  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
