# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=vvenc-git
pkgver=0.2.0.0.r0.g58282d7
pkgrel=1
pkgdesc="Fraunhofer Versatile Video Encoder (VVenC)"
arch=('x86_64')
url='https://github.com/fraunhoferhhi/vvenc'
license=('custom')
depends=('gcc-libs')
makedepends=('git' 'cmake>=3.12' 'gcc>=7')
provides=('vvenc')
conflicts=('vvenc')
source=("git+https://github.com/fraunhoferhhi/vvenc.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/vvenc"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/vvenc"
	export CFLAGS+=" ${CPPFLAGS}"
	export CXXFLAGS+=" ${CPPFLAGS}"
	make install-release-shared
}

package() {
	cd "${srcdir}/vvenc"
	cp -r "install" "$pkgdir/usr"
	mkdir -p "$pkgdir/usr/share/licenses/vvenc"
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/vvenc/"
}
