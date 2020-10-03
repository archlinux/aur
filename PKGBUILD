# Maintainer: Colean <colean@colean.cc>
pkgname=bipscript
pkgver=0.9
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
source=("https://gitlab.domainepublic.net/bipscript/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
	"$pkgname-v$pkgver.patch")
md5sums=('73f2085252e7acbc0a3f35b871c8ea8c'
         '7c5ae9a13b560dac2112ea7c2fecb35f')

prepare() {
        cd "$pkgname-v$pkgver"
        patch -p2 -i "$srcdir/$pkgname-v$pkgver.patch"
}

build() {
	cd "$pkgname-v$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DBIPSCRIPT_VERSION=v$pkgver .
	make
}

package() {
	cd "$pkgname-v$pkgver"
	make DESTDIR="$pkgdir/" install
}
