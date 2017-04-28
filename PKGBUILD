# Maintainer: dobragab <dobragab@gmail.com>

pkgname=('ccsh-shell-git')
pkgver=r127.44f6458
pkgrel=1
pkgdesc='C++ shell'
arch=('any')
url='https://github.com/cpp-ftw/ccsh'
license=('GPL3')
depends=('ccsh-git' 'cling-git')
makedepends=('git' 'cmake' 'make')
source=("git+https://github.com/cpp-ftw/ccsh.git")
md5sums=(SKIP)

pkgver() {
  cd "ccsh"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "ccsh"

  cmake . -DWITH_LIB=OFF -DWITH_TEST=OFF -DWITH_COMPILER=OFF -DWITH_SAMPLE=OFF -DWITH_CLING=ON
  make

  install -Dm755 "$srcdir/ccsh/ccsh" "$pkgdir/usr/bin/ccsh"
  install -Dm644 "$srcdir/ccsh/ui/ccshrc.hpp" "$pkgdir/etc/ccsh/ccshrc.hpp"
}

