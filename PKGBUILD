# Maintainer: Denis Demidov <dennis.demidov@gmail.com>

pkgname=amgcl-git
pkgver=20150713
pkgrel=3
pkgdesc='C++ library for solving large sparse linear systems with algebraic multigrid method'
arch=('i686' 'x86_64')
url='http://github.com/ddemidov/amgcl'
license=('MIT')
depends=('boost-libs')
optdepeneds=('vexcl-git': 'vexcl backend'
             'hpx-git': 'HPX backend'
             'openmpi: distributed memory solver')
provides=('amgcl')
makedepends=('git' 'cmake' 'boost')
source=()

_gitroot='git://github.com/ddemidov/amgcl.git'
_gitname='amgcl'

package() {
  msg "Connecting to GIT server..."
  rm -rf $_gitname
  git clone --depth=1 $_gitroot
  msg "GIT checkout done or server timeout"

  cd $_gitname
  install -d "$pkgdir/usr/include/amgcl"
  find amgcl -type f -exec install -Dm644 '{}' "$pkgdir/usr/include/{}" ';' || return 1
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$_gitname/LICENSE.md" || return 1
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_gitname/README.md" || return 1
}
