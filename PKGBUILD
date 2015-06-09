# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=flatbuffers
pkgver=1.1.0
pkgrel=1
pkgdesc="An efficient cross platform serialization library for C++, with support for Java, C# and Go"
arch=('i686' 'x86_64')
url="http://google.github.io/flatbuffers/"
license=('Apache')
depends=()
makedepends=(cmake)
optdepends=('go' 'java-environment' 'mono')
source=(https://github.com/google/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('a469b3058e53a12d49556e8e1bb5edea')


build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
  _docdir="$pkgdir/usr/share/doc/$pkgname"  
  install -m755 -d $_docdir
  cp -a docs/*.html docs/html $_docdir
}
