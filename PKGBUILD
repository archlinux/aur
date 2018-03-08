# Maintainer: CountMurphy <spartan1086@gmail.com>
# Maintainer: Shelvacu <aur@shelvacu.com>

_gitname=libserial
pkgname="${_gitname}-git"
pkgver=r168.1201211
pkgrel=1
pkgdesc="A library for accessing serial ports on POSIX systems (git version)"
arch=('x86_64')
url="https://github.com/crayzeewulf/${_gitname}/"
license=('GPL2')
makedepends=('git' 'python2-sip' 'gtest')
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

  sed -i '1i#!/usr/bin/bash' compile.sh
  ./compile.sh
}

package() {
  cd "$pkgname"
 mkdir -p $pkgdir/usr/lib
 install -Dm555 build/lib/libserial.so  "$pkgdir/usr/lib/"
}
