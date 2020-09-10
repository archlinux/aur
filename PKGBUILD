# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=vvenc-git
pkgver=r1.2ed056b
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
