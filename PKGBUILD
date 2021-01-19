# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=librw-git
pkgver=r430.c493613
pkgrel=1
pkgdesc='A re-implementation of the RenderWare Graphics engine'
arch=(x86_64)
url=https://github.com/aap/librw
license=(MIT)
depends=(gcc-libs)
makedepends=(cmake git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "${pkgname%-git}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIBRW_INSTALL=ON \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "${pkgname%-git}"/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
