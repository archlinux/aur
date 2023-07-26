# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Matrix <thysupremematrix a_t tuta d_o_t io>
# Contributor: Yamada Hayao <hayao@fascode.net>

pkgname=gnome-shell-extension-desktop-icons-ng
_pkgname=desktop-icons-ng
pkgver=47.0.3
pkgrel=2
pkgdesc="A fork from the official desktop icons project, with several enhancements like Drag'n'Drop."
arch=('any')
url="https://gitlab.com/rastersoft/desktop-icons-ng"
license=('GPL3')
depends=('gnome-shell' 'nautilus' 'file-roller')
makedepends=('meson' 'glib2')
source=("${url}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0e21a476e2ff5ed8ce49e18952bd858b9cd6d10a735761d5a3f2988a8ff60f0a')

build() {
	arch-meson "${_pkgname}-${pkgver}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "${pkgdir}"

	cd "${_pkgname}-${pkgver}"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
