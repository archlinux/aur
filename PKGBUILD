# vim: noai:ts=4:sw=4
# Maintainer: jzbor <zborof at posteo dot de>
# Contributors:
# Robin Candau <antiz@archlinux.org>
# jbouter <aur@kn0x.org>

_pkgname=touchegg
pkgname=${_pkgname}-nosystemd
pkgver=2.0.17
pkgrel=1
pkgdesc="Linux multi-touch gesture recognizer (with systemd support disabled)"
arch=('x86_64' 'i696' 'aarch64')
url="https://github.com/JoseExposito/touchegg"
license=('GPL3')
depends=('libinput' 'cairo' 'systemd-libs' 'libx11' 'libxi' 'libxrandr' 'libxtst' 'pugixml' 'gtk3' 'glib2')
provides=(
	"${_pkgname}=${pkgver}"
	"${_pkgname}-doc=${pkgver}"
)
conflicts=("${_pkgname}")
optdepends=(
	"${_pkgname}-openrc: ${_pkgname} daemon OpenRC startup script."
	"touche: For a configuration GUI (warning, overwrites user config file without warning)."
)
makedepends=('cmake')
source=("${url}/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('b0c957003f0df1c3fdb750e0f3a253ed39014c900c82ffa7be254afe6c2a60949ea81d2628bf3d40ad4f3547093b274fb20831144c2427b417262812a10d563d')

build() {
	cmake -B build -S ${_pkgname}-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DUSE_SYSTEMD=OFF
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}

