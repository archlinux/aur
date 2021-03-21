# Maintainer: fuxter <fuxterz@gmail.com>

_name=linapple
pkgname="${_name}-git"
pkgver=2020.06.01.gae9fd93
pkgrel=1
pkgdesc="Apple 2e emulator"
arch=('i686' 'x86_64')
url="https://github.com/linappleii/linapple.git"
license=('GPL2')
depends=('sdl' 'sdl_image' 'zlib' 'libzip' 'curl')
makedepends=('git')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}::git+https://github.com/linappleii/linapple.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
  cd "$srcdir/${_name}"
  pwd
  export CFLAGS="$CFLAGS $CPPFLAGS"
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/${_name}"
  make DESTDIR="$pkgdir/usr/" install
}

# vim:set ts=2 sw=2 et:
