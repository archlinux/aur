# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-tools
pkgver=3.1.0
pkgrel=1
pkgdesc="kiwix command line tools"
license=('GPL3')
arch=('armv7h' 'i686' 'x86_64')
replaces=('kiwix-cli-git')
depends=('kiwix-lib')
makedepends=('meson')
url='https://github.com/kiwix/kiwix-tools'
source=("https://github.com/kiwix/kiwix-tools/archive/${pkgver}.tar.gz")
sha256sums=(56cda04720c827668b271e1f7fb276626f666b1ac1afdf3322020776fa4c35e1)

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
