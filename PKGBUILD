# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Matrix <thysupremematrix a_t tuta d_o_t io>
# Contributor: Yamada Hayao <hayao@fascode.net>

pkgname=gnome-shell-extension-desktop-icons-ng
_pkgname=desktop-icons-ng
pkgver=47.0.2
pkgrel=1
pkgdesc="A fork from the official desktop icons project, with several enhancements like Drag'n'Drop."
arch=('any')
url="https://gitlab.com/rastersoft/desktop-icons-ng"
license=('GPL3')
depends=('gnome-shell>=3.38')
makedepends=('meson' 'glib2')
source=("${url}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1c66fd62ed7254c028b6a15f5fcf0f02c9536d1aeca9f4dedf39f0a1c65738f1')

build() {
	arch-meson "${_pkgname}-${pkgver}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "${pkgdir}"

	cd "${_pkgname}-${pkgver}"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
