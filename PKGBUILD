# Maintainer: Stefano Campanella <stefanocampanella1729@gmail.com>
pkgname=form-git
_pkgid=${pkgname%-git}
pkgver=4.2.0.r18.gd15ec75
pkgrel=1
pkgdesc="Symbolic Manipulation System developed at Nikhef."
arch=('i686' 'x86_64')
url="https://www.nikhef.nl/~form/"
license=('GPL')
depends=('gmp>=4.2' 'zlib>=1.2')
makedepends=('git')
provides=('form')
source=("git://github.com/vermaseren/form.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgid
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
	cd $_pkgid
	autoreconf -i
	./configure --prefix=/usr
  make ${MAKEFLAGS}
}

package() {
	cd $_pkgid
	make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/share/man/man1
  install doc/form.1 $pkgdir/usr/share/man/man1
}
