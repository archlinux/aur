# Maintainer: John Hammen <jhammen@j2page.com>
pkgname=bipscript
pkgver=0.7
pkgrel=1
pkgdesc="A scripting language for interactive music"
arch=('i686' 'x86_64')
url="http://www.bipscript.org"
license=('GPL')
groups=('pro-audio')
depends=('boost-libs' 'fftw' 'lilv' 'liblo' 'portsmf')
makedepends=('cmake' 'boost' 'lv2')
provides=("bipscript")
conflicts=("bipscript")
source=("https://github.com/bipscript/$pkgname/archive/v$pkgver.tar.gz"
	"$pkgname-v$pkgver.patch")
md5sums=('ccbf7ce80d8ef19c55d15b226d7b8cef'
         '38886856c32d00d420bdf07e7469cfd5')

prepare() {
        cd "$pkgname-$pkgver"
        patch -p2 -i "$srcdir/$pkgname-v$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DBIPSCRIPT_VERSION=v$pkgver .
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

