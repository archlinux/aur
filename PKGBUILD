# Maintainer: Xentec <artificial.i7 at gmail dot com>

pkgname=glbinding-git
pkgver=v1.0.4.r44.g422b7c4
pkgrel=1
pkgdesc="A generated C++ binding for the OpenGL API, generated using the gl.xml specification. (git version)"
arch=('i686' 'x86_64')
url="https://github.com/hpicgs/glbinding"
license=('MIT')
depends=('libgl')
makedepends=('cmake' 'git')
source=("$pkgname"::'git+https://github.com/hpicgs/glbinding.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DOPTION_BUILD_TESTS=OFF \
		-DOPTION_BUILD_STATIC=OFF \
		-Wno-dev \
		.
	make
}

package() {
	cd "$pkgname"

	make DESTDIR="$pkgdir" install

	rm -r "${pkgdir}/usr/share/"

	install -D -m644 glbinding-config.cmake "${pkgdir}/usr/lib/cmake/${pkgname}/glbinding-config.cmake"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

