# Maintainer: Ginko <aur dot pj7ic at passmail dot net>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Christoph Drexler <chrdr at gmx dot at>
# Contributor: me at oguzkaganeren dot com dot tr
pkgname=grisbi
pkgver=3.90.1
_pkgver=upstream_version_3_90_1
pkgrel=1
pkgdesc="Shared files for the finance management program Grisbi."
arch=('x86_64')
url="https://www.grisbi.org"
license=('GPL-2.0-or-later')
depends=('gtk3' 'openssl' 'goffice' 'libofx')
makedepends=('imagemagick' 'libgsf' 'meson')
conflicts=('grisbi-git')
options=(!libtool !debug)
source=(https://github.com/grisbi/grisbi/archive/refs/tags/$_pkgver.tar.gz)
sha256sums=('da7c431601c273481bf606249a834fc40c362b10f8e44f2b3021fe9267a17f1c')

prepare() {
	cd "${srcdir}/grisbi-${_pkgver}"
	cd pixmaps
	convert -size 48x48 -background none grisbi.svg grisbi.png
}

build() {
	cd "${srcdir}/grisbi-${_pkgver}"
	rm -rf build
	meson setup build --prefix=/usr
	meson compile -C build
}

package() {
	cd "${srcdir}/grisbi-${_pkgver}"
	DESTDIR="${pkgdir}" meson install -C build
	install -Dm 0644 "${srcdir}/grisbi-${_pkgver}/pixmaps/grisbi.png" \
		"${pkgdir}/usr/share/pixmaps/grisbi/grisbi.png"
}
