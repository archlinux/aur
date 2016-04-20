# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=libst2205-git
_pkgname="libst2205"
pkgver=r1.a1d9a6b
pkgrel=1
pkgdesc="Library for interacting with hacked st2205 and similar digital photo frames"
arch=('i686' 'x86_64')
url="https://github.com/neophob/libst2205"
license=('GPLv2+')
depends=('systemd' 'libgudev')
makedepends=('git' 'gtk-doc')
source=("git+https://github.com/neophob/libst2205.git"
        "0001-add-missing-fcntl-argument.patch")
md5sums=('SKIP'
         '527ba0abf45405dc34a498533aa70b60')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch < ../../0001-add-missing-fcntl-argument.patch
}

build() {
  cd "$srcdir/$_pkgname"
  make all
}

package() {
  cd "$srcdir/$_pkgname/libst2205"
  install -Dm0755 libst2205.so "${pkgdir}/usr/lib/libst2205.so.1"
  install -Dm0644 st2205.h "${pkgdir}/usr/include/st2205.h"
}
