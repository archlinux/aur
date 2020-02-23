# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-tools
pkgver=3.0.2
pkgrel=2
pkgdesc="kiwix command line tools"
license=('GPL3')
arch=('armv7h' 'i686' 'x86_64')
replaces=('kiwix-cli-git')
depends=('kiwix-lib')
makedepends=('meson')
url='https://github.com/kiwix/kiwix-tools'
source=("https://github.com/kiwix/kiwix-tools/archive/${pkgver}.tar.gz")
sha256sums=(681cf32312d04ed373fcafb278353dcd706b2e6050e2790775e5ffaca77c8bc3)

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
