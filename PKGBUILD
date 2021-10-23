# Maintainer: Atom Long <atom.long@hotmail.com>

pkgname=quickjspp
pkgver=20210913
pkgrel=1
pkgdesc='QuickJS C++ wrapper'
url='https://github.com/ftk/quickjspp'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('CC0')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
makedepends=('cmake' 'git' 'gcc')

pkgver() {
  cd ${pkgname}
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd ${pkgname}
  cmake -DCMAKE_BUILD_TYPE=Release .
  make quickjs
}

package() {
  cd ${pkgname}
  install -Dm644 quickjs/libquickjs.a -t ${pkgdir}/usr/lib/
  install -Dm644 quickjs/quickjs.h quickjs/quickjs-libc.h -t ${pkgdir}/usr/include/quickjs/
  install -m644 quickjspp.hpp ${pkgdir}/usr/include/
}
