# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Hervé Cauwelier <herve ¤ oursours.net>

_gitname=libgit2
pkgname=libgit2-git
pkgver=0.21.0.r65.g9b87998
epoch=2
pkgrel=1
pkgdesc='A linkable library for Git'
arch=('i686' 'x86_64')
url="http://libgit2.github.com/"
license=('GPL2')
depends=(zlib openssl libssh2)
makedepends=(cmake python2 git)
provides=('libgit2')
conflicts=('libgit2')
source=(git://github.com/libgit2/libgit2.git)
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

build() {
  cd $_gitname
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DTHREADSAFE=ON -DPYTHON_EXECUTABLE=/usr/bin/python2
  make
}

check() {
  make -C $_gitname test
}

package() {
  make -C $_gitname DESTDIR="$pkgdir" install
}
