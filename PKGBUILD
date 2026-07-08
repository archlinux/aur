# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=nativefiledialog-extended
pkgver=1.3.0
pkgrel=1
pkgdesc="Cross platform (Windows, Mac, Linux) native file dialog library"
arch=('x86_64')
url="https://github.com/btzy/nativefiledialog-extended"
conflicts=('libnfd')
depends=('glibc' 'glib2' 'gtk3' 'dbus')
makedepends=('cmake')
license=('Zlib')
_srcname="nativefiledialog-extended-${pkgver}"
source=(
	"${_srcname}.tar.gz::https://github.com/btzy/nativefiledialog-extended/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('2fea19102cf4d5283a80fb87a784792166988e85bb92baa962d34f72b22dcc1a')

build() {
	cmake -S "${_srcname}" -B build \
		-Wno-dev \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		# EOL
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "${_srcname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
