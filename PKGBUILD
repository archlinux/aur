# Maintainer: Denis Demidov <dennis.demidov@gmail.com>

pkgname=vexcl-git
pkgver=20150710
pkgrel=4
pkgdesc='a C++ vector expression template library for OpenCL/CUDA'
arch=('i686' 'x86_64')
url='http://github.com/ddemidov/vexcl'
license=('MIT')
depends=('boost-libs')
conflicts=('vexcl')
provides=('vexcl')
makedepends=('git' 'cmake' 'boost' 'opencl-headers')
source=()

_gitroot='git://github.com/ddemidov/vexcl.git'
_gitname='vexcl'

package() {
  msg "Connecting to GIT server..."
  rm -rf $_gitname
  git clone --depth=1 $_gitroot
  msg "GIT checkout done or server timeout"

  cd $_gitname
  install -d "$pkgdir/usr/include/vexcl"
  find vexcl -type f -exec install -Dm644 '{}' "$pkgdir/usr/include/{}" ';' || return 1
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$_gitname/LICENSE.md" || return 1
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_gitname/README.md" || return 1
}
