# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Matrix <thysupremematrix a_t tuta d_o_t io>
# Contributor: Yamada Hayao <hayao@fascode.net>

pkgname=gnome-shell-extension-desktop-icons-ng
_pkgname=desktop-icons-ng
pkgver=47.0.4
pkgrel=1
pkgdesc="A fork from the official desktop icons project, with several enhancements like Drag'n'Drop."
arch=('any')
url="https://gitlab.com/rastersoft/desktop-icons-ng"
license=('GPL3')
depends=('gnome-shell' 'nautilus' 'file-roller')
makedepends=('meson' 'glib2')
source=("${url}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('80444f1545580ff3f9a5e38bfdfc1c830d69e060463c32be26a722dbaee14f28')

build() {
	arch-meson "${_pkgname}-${pkgver}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "${pkgdir}"

	cd "${_pkgname}-${pkgver}"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
