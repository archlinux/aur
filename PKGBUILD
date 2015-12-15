# Maintainer: dequis <dx@dxzone.com.ar>
# Previous maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=rr-git
pkgver=4.0.2.r59.g7770179
pkgrel=1
pkgdesc='a nondeterministic debugger'
arch=(i686 x86_64)
url='http://rr-project.org/'
license=('custom')
depends=('libpfm4' 'libdisasm' 'python2-pexpect')
makedepends=('git' 'cmake')
[ "$CARCH" = 'x86_64' ] && makedepends+=('gcc-multilib')
source=(git://github.com/mozilla/rr)
sha1sums=('SKIP')
provides=('rr')
conflicts=('rr')

pkgver() {
	cd rr
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd rr
	mkdir -p build
}

build() {
	cd rr/build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..

	make
}

package() {
	cd rr/build
	make DESTDIR="${pkgdir}" install
	cd ..
	install -D LICENSE "${pkgdir}/usr/share/licenses/rr/LICENSE"
}
