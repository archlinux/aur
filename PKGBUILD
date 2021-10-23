# Maintainer: Atom Long <atom.long@hotmail.com>

pkgname=quickjspp-git
pkgver=20210913
pkgrel=5
pkgdesc='QuickJS C++ wrapper'
url='https://github.com/ftk/quickjspp'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('CC0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}"
           "quickjs")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')
makedepends=('cmake' 'git')
options=(!strip)

pkgver() {
  cd ${pkgname%-git}
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd ${pkgname%-git}
  cmake -DCMAKE_BUILD_TYPE=Release .
  make quickjs
}

package() {
  cd ${pkgname%-git}
  install -Dm644 quickjs/libquickjs.a -t ${pkgdir}/usr/lib/
  install -Dm644 quickjs/quickjs.h quickjs/quickjs-libc.h -t ${pkgdir}/usr/include/quickjs/
  install -m644 quickjspp.hpp ${pkgdir}/usr/include/
}
