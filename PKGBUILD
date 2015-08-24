# Maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=rr
pkgver=3.0.0
pkgrel=1
pkgdesc='a nondeterministic debugger'
arch=(i686 x86_64)
url='http://rr-project.org/'
license=('custom')
depends=('libpfm4' 'libdisasm')
makedepends=('git' 'cmake')
source=(https://github.com/mozilla/${pkgname}/archive/${pkgver}.tar.gz)
sha1sums=('5435124699a629ca933ebed9515fed5cc92f3bbc')

prepare() {
	cd $pkgname-$pkgver
	mkdir build
	sed -i~ -e 's/ python / python2 /g' CMakeLists.txt 
	sed -i~ -e 's/^\(#define \)_BSD_SOURCE$/\1_DEFAULT_SOURCE/' src/Command.cc

}

build() {
	cd $pkgname-$pkgver/build
	cmake ..

    make
}

package() {
	cd $pkgname-$pkgver/build
    make DESTDIR="${pkgdir}" install
	cd ..
	install -D LICENSE "${pkgdir}/usr/share/licenses/rr/LICENSE"
}
