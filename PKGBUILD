# Maintainer: John Hammen <jhammen@j2page.com>
pkgname=bipscript
pkgver=0.4
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
md5sums=('73ecad2eca761dbbe40e92ae2484066a'
         'c775c269b2b654289b93e34858a85699')

prepare() {
        cd "$pkgname-$pkgver"
        patch -p2 -i "$srcdir/$pkgname-v$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

