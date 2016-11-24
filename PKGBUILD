# Maintainer: Tim DeHerrera <tim.de9@gmail.com>
pkgname=silentarmy-nvmod-git
pkgver=v5.29.g016f8e8
pkgrel=1
pkgdesc="GPU Zcash Equihash solver optimized for Nvidia and CUDA 8"
arch=('i686' 'x86_64')
url="https://github.com/krnlx/silentarmy-nvmod"
license=('MIT')
conflicts=('silentarmy, silentarmy-git')
provides=('silentarmy')
source=('git+https://github.com/krnlx/silentarmy-nvmod.git')
depends=('libcl' 'opencl-headers' 'python')
md5sums=('SKIP')

_gitname='silentarmy-nvmod'

pkgver() {
  cd "$srcdir/$_gitname"
  echo "$(git describe | sed s/-/./g)"
}

build() {
  cd "$srcdir/$_gitname"
  make
}

check() {
  cd "$srcdir/$_gitname"
  make test
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/bin"
  install silentarmy "$pkgdir/usr/bin/"
  install sa-solver "$pkgdir/usr/bin/"
}
