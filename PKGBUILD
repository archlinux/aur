# Maintainer: Jonathan Steel <mail at jsteel dot org> 

pkgname=dgen-sdl-git
_gitname=dgen
pkgver=v1.32.2.g8cf4cd9
pkgrel=1
pkgdesc="Portable Sega Genesis/Mega Drive emulator"
arch=('i686' 'x86_64')
url="http://dgen.sourceforge.net"
license=('BSD')
depends=('sdl' 'libgl' 'libarchive')
makedepends=('nasm' 'git')
conflicts=('dgen-sdl')
source=(git://dgen.git.sourceforge.net/gitroot/dgen/dgen)
md5sums=('SKIP')

pkgver() {
  cd $_gitname

  git describe | sed s/-/./g
}

build() {
  cd $_gitname

  ./autogen.sh

  ./configure --prefix=/usr --disable-hqx

  make
}

package() {
  cd $_gitname

  make DESTDIR="$pkgdir"/ install

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
