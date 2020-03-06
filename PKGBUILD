# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>

pkgname=xwingridselect-git
_gitname=xwingridselect
pkgver=v0.1
pkgrel=1
pkgdesc="X11 window switcher with fancy look"
url="http://github.com/TheCynicalTeam/$_gitname"
arch=('any')
license=('GPLv3')
depends=('gtk2')
makedepends=('cmake' 'git' 'make')
options=(!libtool strip)

source=("git://github.com/TheCynicalTeam/$_gitname.git")
md5sums=('SKIP')
sha256sums=("SKIP")

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DWITH_SCRIPTS=ON "$srcdir/$_gitname"
  make || return 1
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}
