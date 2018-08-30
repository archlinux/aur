# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-tools
pkgver=0.6.1
pkgrel=1
pkgdesc="kiwix command line tools"
license=('GPL3')
arch=('any')
replaces=('kiwix-cli-git')
depends=('kiwix-lib>=2.0.1' 'libmicrohttpd')
makedepends=('meson')
url='https://github.com/kiwix/kiwix-tools'
source=("https://github.com/kiwix/kiwix-tools/archive/${pkgver}.tar.gz")
sha256sums=(9156f672584ce5c4a6a334020b8dd2a0afe01c01ae99e29f8c53a87c5c3ae6c4)

build() {
	cd "${pkgname}-${pkgver}"
	arch-meson build
	ninja -C build
}

check() {
	cd "${pkgname}-${pkgver}/build"
	ninja meson-test
}

package() {
	cd "${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}
