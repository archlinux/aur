# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-tools
pkgver=1.2.1
pkgrel=2
pkgdesc="kiwix command line tools"
license=('GPL3')
arch=('any')
replaces=('kiwix-cli-git')
depends=('kiwix-lib>=5.0.0' 'libmicrohttpd')
makedepends=('meson')
url='https://github.com/kiwix/kiwix-tools'
source=("https://github.com/kiwix/kiwix-tools/archive/${pkgver}.tar.gz")
sha256sums=(e8a218a7a8aedbcb279820ff6d241bb60e046eb4173f9bc7ae0fd3cbd0b52e8e)

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
