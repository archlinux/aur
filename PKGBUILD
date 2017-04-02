# Maintainer:  yantene <contact@yantene.net>

pkgname=simstring-git
_gitname=simstring
pkgver=6209ea8
pkgrel=1
pkgdesc="A simple and efficient algorithm for approximate string matching"
url="http://www.chokkan.org/software/simstring/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('gcc-libs-multilib')
makedepends=('git')
optdepends=()
#depends+=()
provides=('simstring')
conflicts=()
source=('git+https://github.com/chokkan/simstring.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --tags --always | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_gitname
  ./autogen.sh
}

build() {
  cd $_gitname
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/simstring-git/COPYING"
}
