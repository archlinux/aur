# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=vvenc-git
pkgver=0.1.0.1.r0.gbc966db
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
	mkdir -p "$pkgdir/usr/share/licenses/vvenc"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib"
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/vvenc/"
	install -Dm755 "install/bin/release-shared/vvencapp" "$pkgdir/usr/bin/"
	install -Dm755 "install/bin/release-shared/vvencFFapp" "$pkgdir/usr/bin/"
	install -Dm755 "install/lib/release-shared/libvvenc.so" "$pkgdir/usr/lib/"
	cp -r "install/include" "$pkgdir/usr/"
	cp -r "install/lib/cmake" "$pkgdir/usr/lib/"
}
