# Maintainer: Brodi <me@brodi.space>
_pluginname=image-reaction
pkgname=obs-${_pluginname}
pkgver=1.0
pkgrel=1
pkgdesc="OBS Plugin with image that reacts to sound source."
arch=("x86_64")
url="https://github.com/scaledteam/obs-image-reaction"
license=("GPL2")
depends=("obs-studio>=24.0.0")
makedepends=("cmake")
provides=("obs-${_pluginname}")
conflicts=("obs-${_pluginname}-bin" "obs-${_pluginname}-git")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
	"https://raw.githubusercontent.com/scaledteam/obs-image-reaction/${pkgver}/LICENSE")
sha512sums=("3b4823aa5aef4c335ecea3c927e3687bea82c27095f80d9d76ef266d4b0e567e6d1efee1949ea4f90fc7d86d8f7e9ebcbf7d8dbdcbd599a5e436edaeeacf0401"
	"SKIP")

prepare() {
	rm -rf ${srcdir}/obs-${_pluginname}-${pkgver}/build
}

build() {
	cd ${srcdir}/obs-${_pluginname}-${pkgver}
	mkdir build
	cd build
	cmake ..
	make
}

package() {
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/obs-${_pluginname}/LICENSE"

	cd ${srcdir}/obs-${_pluginname}-${pkgver}/build
	install -d ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 libimage-reaction.so ${pkgdir}/usr/lib/obs-plugins/
}
