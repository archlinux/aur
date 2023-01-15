# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Christoph Drexler <chrdr at gmx dot at>
# Contributor: me at oguzkaganeren dot com dot tr
pkgname=grisbi
pkgver=2.0.5
_pkgver=upstream_version_2_0_5
pkgrel=5
pkgdesc="Shared files for the finance management program Grisbi."
arch=('x86_64')
url="https://www.grisbi.org"
license=('GPL')
depends=('gtk3' 'libgsf' 'openssl-1.1')
optdepends=('libofx: for OFX support')
makedepends=('intltool' 'imagemagick')
provides=('grisbi')
conflicts=('grisbi-git')
replaces=('grisbi')
options=(!libtool)
source=(https://github.com/grisbi/grisbi/archive/refs/tags/$_pkgver.tar.gz)
sha256sums=('69f5cd60748864e0fb9c6d99f10bf7b9b022b87748a9c8a0fb7408267765bd66')

prepare() {
	cd "${srcdir}/grisbi-${_pkgver}"
	cd pixmaps
	convert -size 48x48 -background none grisbi.svg grisbi.png
}

build() {
	cd "${srcdir}/grisbi-${_pkgver}"
	./autogen.sh
	./configure \
		--disable-frenchdoc \
		--prefix=/usr
	make
}

package() {
	cd "${srcdir}/grisbi-${_pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm 0644 "${srcdir}/grisbi-${_pkgver}/pixmaps/grisbi.png" \
		"${pkgdir}/usr/share/pixmaps/grisbi/grisbi.png"
}
