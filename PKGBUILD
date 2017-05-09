# Maintainer: dobragab <dobragab@gmail.com>

pkgname=('ccsh-git' 'ccsh-compiler-git' 'ccsh-wrappers-core-git')
groups=('ccsh-git')
pkgver=r154.7c8b4cd
pkgrel=1
pkgdesc='C++ shell'
arch=('any')
url='https://github.com/cpp-ftw/ccsh'
license=('GPL3')
makedepends=('git' 'cmake' 'make')
optdepends=('pkg-config: specify compilation flags easier')
source=("git+https://github.com/cpp-ftw/ccsh.git")
md5sums=(SKIP)

pkgver() {
  cd "ccsh"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "ccsh"

  cmake . -DWITH_LIB=ON -DWITH_COMPILER=ON -DWITH_SAMPLE=OFF -DWITH_TEST=OFF -DWITH_CLING=OFF
  make
}

package_ccsh-git() {

  install -Dm644 "$srcdir/ccsh/lib/libccsh_lib.so" "$pkgdir/usr/lib/libccsh_lib.so"

  install -dm755 "$pkgdir/usr/include/ccsh"
  install -Dm644 $srcdir/ccsh/include/ccsh/*.hpp "$pkgdir/usr/include/ccsh"

  install -dm755 "$pkgdir/usr/include/ccsh/builtins"
  install -Dm644 $srcdir/ccsh/include/ccsh/builtins/*.hpp "$pkgdir/usr/include/ccsh/builtins"

  install -dm755 "$pkgdir/usr/lib/pkgconfig"
  install -Dm644 $srcdir/ccsh/ccsh.pc "$pkgdir/usr/lib/pkgconfig"
}

package_ccsh-compiler-git() {
  depends=('ccsh-git')

  install -Dm755 "$srcdir/ccsh/cc/ccshc" "$pkgdir/usr/bin/ccshc"
}

package_ccsh-wrappers-core-git() {
  depends=('ccsh-git')

  install -Dm644 "$srcdir/ccsh/wrappers/ccsh/core.hpp" "$pkgdir/usr/include/ccsh/core.hpp"
  install -dm755 "$pkgdir/usr/include/ccsh/core"
  install -Dm644 $srcdir/ccsh/wrappers/ccsh/core/* "$pkgdir/usr/include/ccsh/core"
}

