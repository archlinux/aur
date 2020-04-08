# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-tools
pkgver=3.0.3
pkgrel=2
pkgdesc="kiwix command line tools"
license=('GPL3')
arch=('armv7h' 'i686' 'x86_64')
replaces=('kiwix-cli-git')
depends=('kiwix-lib')
makedepends=('meson')
url='https://github.com/kiwix/kiwix-tools'
source=("https://github.com/kiwix/kiwix-tools/archive/${pkgver}.tar.gz")
sha256sums=(d287fbb3819007254f3d5fd7e650a7b651c52a3f02e86aaa7025880243343d29)

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
