# Maintainer: rho <rho.rhoit@gmail.com>

pkgname=2048-puzzle-bash-git
pkgver=4.0
pkgrel=1
pkgdesc="A bash implementation of 2048 puzzle game"
arch=('any')
url="https://github.com/rhoit/2048"
license=('MIT')
depends=('bash')
optdepends=('figlet')
makedepends=('git')
source=('git+https://github.com/rhoit/2048.git')
md5sums=('SKIP')
_gitname="2048"

prepare() {
  cd $_gitname
  git submodule init
  git submodule update
}

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  ./configure
}

package() {
  cd $_gitname
  mkdir -p "$pkgdir/usr/local/bin"
  DESTDIR="$pkgdir" make install
}
