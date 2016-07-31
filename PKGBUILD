# Maintainer: rho <rho.rhoit@gmail.com>

pkgname=lights-out-puzzle-git
pkgver=0.99.r1.g0564620
pkgrel=1
pkgdesc="A bash implementation of lights-out puzzle game"
arch=('any')
url="https://github.com/rhoit/lights-out"
license=('MIT')
depends=('bash' 'sed')
optdepends=('figlet')
makedepends=('git')
source=('git+https://github.com/rhoit/lights-out.git')
md5sums=('SKIP')
_gitname="lights-out"

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
  git describe --tags > .version
}

package() {
  cd $_gitname
  mkdir -p "$pkgdir/usr/local/bin"
  DESTDIR="$pkgdir" make install
}
