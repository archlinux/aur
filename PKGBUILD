# Maintainer: dobragab <dobragab@gmail.com>

pkgname=('ccsh-git' 'ccsh-wrappers-core-git')
groups=('ccsh-git')
pkgver=r83.d0f0cf5
pkgrel=1
pkgdesc='C++ shell'
arch=('any')
url='https://github.com/cpp-ftw/ccsh'
license=('GPL3')
depends=('boost')
makedepends=('git' 'cmake' 'make')
source=("git+https://github.com/cpp-ftw/ccsh.git")
md5sums=(SKIP)

pkgver() {
  cd "ccsh"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_ccsh-git() {
  cd "ccsh"
  
  cmake . -DWITH_LIB=ON -DWITH_TEST=OFF -DWITH_CLING=OFF
  make
  
  install -Dm644 "$srcdir/ccsh/lib/libccsh_lib.so" "$pkgdir/usr/lib/libccsh_lib.so"
  
  install -dm755 "$pkgdir/usr/include/ccsh"
  install -Dm644 $srcdir/ccsh/include/ccsh/* "$pkgdir/usr/include/ccsh"
}

package_ccsh-wrappers-core-git() {
  depends=('ccsh-git')
	
  cd "ccsh"

  install -Dm644 "$srcdir/ccsh/wrappers/ccsh/core.hpp" "$pkgdir/usr/include/ccsh/core.hpp"
  install -dm755 "$pkgdir/usr/include/ccsh/core"
  install -Dm644 $srcdir/ccsh/wrappers/ccsh/core/* "$pkgdir/usr/include/ccsh/core"
}

