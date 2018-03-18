# Maintainer: Taran Lynn <taranlynn0@gmail.com>
pkgname=choria-git
pkgver=v0.4.2.r1305.g87ee046d
pkgrel=2
pkgdesc="A 2D MMORPG that's all about grinding and doing chores (development version)."
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/choria"
license=('GPL3')
depends=('gcc-libs' 'irrlicht' 'sqlite' 'glm' 'sdl2_image')
conflicts=('choria')
makedepends=('cmake')
source=("${pkgname}::git+https://github.com/jazztickets/choria")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
