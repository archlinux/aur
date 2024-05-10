# Maintainer: Martin Rys <rys.pw/contact>
# Previous Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=Flatseal
pkgname=flatseal
pkgver=2.2.0
pkgrel=1
pkgdesc='A permissions manager for Flatpak.'
url="https://github.com/tchx84/Flatseal/"
arch=('any')
license=('GPL-3.0-only')
depends=('flatpak' 'gjs' 'webkitgtk-6.0' 'libhandy' 'appstream-glib' 'libadwaita')
makedepends=('meson' 'flatpak-builder' 'ninja')
source=("${pkgname}-${pkgver}::https://github.com/tchx84/Flatseal/archive/v${pkgver}.tar.gz"
        "appstream.patch") # https://github.com/tchx84/Flatseal/pull/617
sha256sums=('e95a61b4a6031a364a135aaae9d93404890a338c4e6b225944d640058e03923c'
            'df3d2c827cd6d64aed9511764d8367695ab96c4c156c259d42ff4981c8f50e0b')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -p1 < "${srcdir}/appstream.patch"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	meson setup --prefix /usr --buildtype=plain . build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" meson install -C build
}
