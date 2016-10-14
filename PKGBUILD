# Maintainer: Chromaryu <knight.ryu12@gmail.com>
pkgname=libxmp-git
pkgver=libxmp.4.4.1.r3.gf573488
pkgrel=1
pkgdesc="Library that supports over 90 module formats (Amiga, Atari, ..)"
arch=('i686' 'x86_64')
url="http://xmp.sourceforge.net/"
license=('GPL')
depends=('glibc')
optdepends=('pulseaudio')
makedepends=('git')
conflicts=('libxmp')
provides=('libxmp')
source=("$pkgname"::"git+https://github.com/cmatsuoka/libxmp.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	autoconf
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}
