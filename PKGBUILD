# Maintainer: Brodi <me@brodi.space>
_pluginname=image-reaction
pkgname=obs-${_pluginname}
pkgver=1.2
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
sha512sums=("d8a83a92a057903f6b70da58cb93e49f3eac04e5d248c645758b0862e36a495fa1f0d1a101ff53b5471406a5d21e907e6f255566c1f242dc767f8dbe7d586ce7"
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
