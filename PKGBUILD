# Maintainer: Marco44 <cousinmarc at gmail dot com>
pkgname=pldebugger-git
_gitname=pldebugger
pkgver=v1.4.r0.g0b35ef2
pkgrel=1
pkgdesc="PL/pgSQL debugger server-side code"
arch=('i686' 'x86_64')
url=https://github.com/EnterpriseDB/pldebugger
license=('Artistic2.0')
depends=('postgresql')
makedepends=(git llvm clang)
options=(!emptydirs !libtool)
source=('git+https://github.com/EnterpriseDB/pldebugger.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _gitdir=$srcdir/$_gitname
  cd $_gitdir
  git clean -dfx
  git reset --hard
  USE_PGXS=1 make
}

package() {
  cd $srcdir/$_gitname
  USE_PGXS=1 make DESTDIR="$pkgdir/" install
}
