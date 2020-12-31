# Maintainer: Abakus <java5@arcor.de>
pkgname=nasm-git
pkgver=20201104
pkgrel=1
pkgdesc="80x86 assembler designed for portability and modularity"
arch=('i686' 'x86_64')
url="https://www.nasm.us/"
depends=('glibc')
makedepends=('git' 'asciidoc')
license=('GPL')
provides=('nasm')
conflicts=('nasm')
source=('git://github.com/netwide-assembler/nasm.git')
md5sums=('SKIP')

_gitname="nasm"

pkgver() {
  cd "$srcdir/$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$_gitname"

  ./autogen.sh
  ./configure --prefix=/usr
  make
  make manpages
  make strip
}

package() {
  cd "$srcdir/$_gitname"
  make prefix="$pkgdir/usr" install
}
          
