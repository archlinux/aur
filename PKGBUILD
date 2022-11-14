# Maintainer: Tobias Langendorf <junglerobba@jngl.one>

pkgname=wlrobs
pkgver=1.1
pkgrel=2
pkgdesc="An obs-studio plugin that allows you to screen capture on wlroots based wayland compositors"
arch=('i686' 'x86_64')
url='https://hg.sr.ht/~scoopta/wlrobs'
license=('GPL3')
depends=('obs-studio' 'wlroots')
makedepends=('meson')
source=("${pkgname}-v${pkgver}.tar.gz::https://hg.sr.ht/~scoopta/wlrobs/archive/v${pkgver}.tar.gz")
sha256sums=('5311c434316577b27803b272cb57011515f853705ef5d7e604ed73c483fa14be')

build() {
	cd "${pkgname}-v${pkgver}"
	meson build
	ninja -C build
}

package() {
	cd "${pkgname}-v${pkgver}"
	mkdir -p ${pkgdir}/usr/lib/obs-plugins
	install -D -m 0644 build/libwlrobs.so \
		${pkgdir}/usr/lib/obs-plugins/wlrobs.so
}
