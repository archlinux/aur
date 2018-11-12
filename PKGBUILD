# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-tools
pkgver=0.8.0
pkgrel=1
pkgdesc="kiwix command line tools"
license=('GPL3')
arch=('any')
replaces=('kiwix-cli-git')
depends=('kiwix-lib>=3.0.3' 'libmicrohttpd')
makedepends=('meson')
url='https://github.com/kiwix/kiwix-tools'
source=("https://github.com/kiwix/kiwix-tools/archive/${pkgver}.tar.gz")
sha256sums=(4cf3289670d42cdc9a5c9145544f9936aa0a2f125582b36ac843177f69487295)

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
