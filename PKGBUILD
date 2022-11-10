# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=libfragmentzip-git
pkgver=r58.ffec726
pkgrel=1
pkgdesc="A library allowing to download single files from a remote zip archive"
arch=(i686 x86_64)
url="https://github.com/tihmstar/libfragmentzip"
license=('LGPL3')
groups=()
depends=('curl' 'libzip' 'zlib')
makedepends=('git' 'libgeneral')
provides=(libfragmentzip)
conflicts=(libfragmentzip)
source=("git+https://github.com/tihmstar/libfragmentzip")
md5sums=('SKIP')

function pkgver() {
  cd libfragmentzip

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd libfragmentzip

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd libfragmentzip

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
