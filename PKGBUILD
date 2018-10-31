# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-tools
pkgver=0.7.0
pkgrel=1
pkgdesc="kiwix command line tools"
license=('GPL3')
arch=('any')
replaces=('kiwix-cli-git')
depends=('kiwix-lib>=3.0.0' 'libmicrohttpd')
makedepends=('meson')
url='https://github.com/kiwix/kiwix-tools'
source=("https://github.com/kiwix/kiwix-tools/archive/${pkgver}.tar.gz")
sha256sums=(c4f3bfabc5e5ddc13a5bd968ab1a43ea43d9864090328ce8d55ded677f8d008e)

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
