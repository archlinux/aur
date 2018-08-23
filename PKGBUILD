# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-tools
pkgver=0.6.0
pkgrel=2
pkgdesc="kiwix command line tools"
license=('GPL3')
arch=('any')
replaces=('kiwix-cli-git')
depends=('kiwix-lib>=2.0.1' 'libmicrohttpd')
makedepends=('meson')
url='https://github.com/kiwix/kiwix-tools'
source=("https://github.com/kiwix/kiwix-tools/archive/${pkgver}.tar.gz")
sha256sums=(0907b21937d64bf89950c50ea8a8d396cf88bb8db76cc51f4fdcbdedbbd71cc2)

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
