# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Hervé Cauwelier <herve ¤ oursours.net>

_gitname=libgit2
pkgname=libgit2-git
pkgver=1.1.0.r279.g935f85131
epoch=2
pkgrel=1
pkgdesc='A linkable library for Git'
arch=('i686' 'x86_64')
url="https://libgit2.github.com/"
license=('GPL2')
depends=('curl' 'http-parser')
makedepends=(cmake python git)
provides=('libgit2')
conflicts=('libgit2')
source=(git+https://github.com/libgit2/libgit2.git)
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

build() {
  cd $_gitname
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DTHREADSAFE=ON
  make
}

check() {
  make -C $_gitname test
}

package() {
  make -C $_gitname DESTDIR="$pkgdir" install
}
