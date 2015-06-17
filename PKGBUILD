# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=8cc-git
pkgver=r742.495a60d
pkgrel=1
pkgdesc='Simple and clean C11 compiler'
arch=(i686 x86_64)
url='https://github.com/rui314/8cc'
license=(MIT)
depends=(glibc)
makedepends=(git)
source=(git://github.com/rui314/8cc
        fix_cflags.patch)
sha1sums=('SKIP'
          'e9045cbcad942c39e4135ea720100c54996d8422')

pkgver() {
  cd 8cc
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd 8cc
  patch -p1 < ../fix_cflags.patch
  find -name '*.py' -exec sed -i 's|^#!/usr/bin/python$|#!/usr/bin/python2|' {} \;
}

build() {
  cd 8cc
  make
}

check() {
  cd 8cc
  make test
}

package() {
  cd 8cc

  install -Dm755 8cc "$pkgdir/usr/bin/8cc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

