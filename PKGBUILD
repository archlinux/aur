# Maintainer: Anton S. Lobashev <soulthreads@yandex.ru>
pkgname=xwinmosaic-git
_gitname=xwinmosaic
pkgver=v0.4.2
pkgrel=1
pkgdesc="X11 window switcher with fancy look"
url="http://github.com/soulthreads/xwinmosaic"
arch=('i686' 'x86_64')
license=('BSD')
depends=('gtk2')
makedepends=('cmake' 'git')
options=(!libtool strip)

source=('git://github.com/soulthreads/xwinmosaic.git')
md5sums=('SKIP')

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
