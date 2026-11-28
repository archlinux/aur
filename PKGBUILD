# Maintainer: Mike Pento <mjpento@gmail.com>

pkgname=libspeedhack-git
pkgver=r19.c9ac145
pkgrel=1
pkgdesc="A simple dynamic library to slowdown or speedup games on Linux"
arch=('x86_64')
url="https://github.com/evg-zhabotinsky/libspeedhack"
depends=('glibc' 'libgcc' 'libstdc++' 'bash')
options+=('!debug')
license=('MIT')
makedepends=('git')
source=("$pkgname::git+https://github.com/evg-zhabotinsky/libspeedhack.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "$srcdir/$pkgname"
  
  make

  install -Dm755 speedhack "${pkgdir}/usr/bin/speedhack"
  install -Dm755 lib/libspeedhack.so "${pkgdir}/usr/lib/libspeedhack.so"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/libspeedhack-git/LICENSE"
}
