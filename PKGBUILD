# Maintainer: dequis <dx@dxzone.com.ar>
# Previous maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=rr
pkgver=4.0.3
pkgrel=3
pkgdesc='a nondeterministic debugger'
arch=(i686 x86_64)
url='http://rr-project.org/'
license=('custom')
depends=('python2-pexpect' 'gdb')
makedepends=('git' 'cmake' 'gdb')
[ "$CARCH" = 'x86_64' ] && makedepends+=('gcc-multilib')
source=(https://github.com/mozilla/${pkgname}/archive/${pkgver}.tar.gz)
sha1sums=('d41f76d1207fbc153a50dee93f7a9383d8b5e597')

prepare() {
	cd $pkgname-$pkgver
	mkdir -p build
}

build() {
	cd $pkgname-$pkgver/build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..

	make
}

package() {
	cd $pkgname-$pkgver/build
	make DESTDIR="${pkgdir}" install
	cd ..
	install -D LICENSE "${pkgdir}/usr/share/licenses/rr/LICENSE"
}
