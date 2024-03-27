# Maintainer: Martin Rys <rys.pw/contact>
# Previous Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=Flatseal
pkgname=flatseal
pkgver=2.1.2
pkgrel=1
pkgdesc='A permissions manager for Flatpak.'
url="https://github.com/tchx84/Flatseal/"
arch=('any')
license=('GPL-3.0-only')
depends=('flatpak' 'gjs' 'webkitgtk-6.0' 'libhandy' 'appstream-glib' 'libadwaita')
makedepends=('meson' 'flatpak-builder' 'ninja')
source=("${pkgname}-${pkgver}::https://github.com/tchx84/Flatseal/archive/v${pkgver}.tar.gz"
        "appstream.patch") # https://github.com/tchx84/Flatseal/pull/617
sha256sums=('3f942a1f4120c2b97a3f6476c81bd8f6e79d91ef47f7a15db680e94e6019895d'
            '505a24f2f97856f6a03b07dd51c58a1f7eeaf35432348879ae553305203f1bfb')

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
