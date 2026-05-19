# Maintainer: smiley <smiley@aur.archlinux.org>
pkgname="hyprsysteminfo"
pkgver=0.2.0
pkgrel=1
pkgdesc="A tiny qt6/qml application to display information about the running system"
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/hyprsysteminfo"
license=('BSD-3-Clause')
depends=('hyprtoolkit' 'hyprutils' 'libpci')
makedepends=('cmake' 'glaze')
source=(
	"https://github.com/hyprwm/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	'hyprsysteminfo-rebuild.hook'
)
conflicts=("${pkgname}-git")
sha256sums=(
	'4f875e7e986deeda35c05090b59f11f3b5802cac8863dafcc6e8251ea37530b1'
	SKIP
)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake --no-warn-unused-cli \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-S . \
		-B build
	cmake --build build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/hyprsysteminfo-rebuild.hook" \
		"${pkgdir}/usr/share/doc/${pkgname}/examples/hyprsysteminfo-rebuild.hook"
}
