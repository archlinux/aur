# Maintainer: Vincent Grande <shoober420@gmail.com>
# Contributor: grimi <grimi at poczta dot fm>
# Contributor: Chromaryu <knight.ryu12@gmail.com>
pkgname=lib32-libxmp-git
pkgver=4.4.1.r113.g19ad5b32
pkgrel=1
pkgdesc="Library that supports over 90 module formats (Amiga, Atari, ..)"
arch=('i686' 'x86_64')
url="http://xmp.sourceforge.net/"
license=('GPL')
depends=('glibc')
makedepends=('git')
conflicts=('lib32-libxmp')
provides=('lib32-libxmp')
source=("$pkgname"::"git+https://github.com/cmatsuoka/libxmp.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cd "$srcdir/$pkgname"
	autoconf
	./configure --prefix=/usr --libdir=/usr/lib32
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install

        rm -rf "${pkgdir}"/usr/{include,share,bin}
}
