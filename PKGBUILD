# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-tools
pkgver=3.1.2
pkgrel=4
pkgdesc="kiwix command line tools"
license=('GPL3')
arch=('armv7h' 'i686' 'x86_64')
replaces=('kiwix-cli-git')
depends=('kiwix-lib')
makedepends=('meson')
url='https://github.com/kiwix/kiwix-tools'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(86325ec31976d40357f08c520806cf223fa1b0a5edb02ad106c2a0d6746ca364)

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
	install -Dm644 "${pkgname}-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	cd "${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}
