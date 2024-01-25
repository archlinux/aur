# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Christoph Drexler <chrdr at gmx dot at>
# Contributor: me at oguzkaganeren dot com dot tr
pkgname=grisbi
pkgver=3.0.3
_pkgver=upstream_version_3_0_3
pkgrel=1
pkgdesc="Shared files for the finance management program Grisbi."
arch=('x86_64')
url="https://www.grisbi.org"
license=('GPL')
depends=('gtk3' 'libgsf' 'openssl')
optdepends=('libofx: for OFX support')
makedepends=('intltool' 'imagemagick')
provides=('grisbi')
conflicts=('grisbi-git')
replaces=('grisbi')
options=(!libtool)
source=(https://github.com/grisbi/grisbi/archive/refs/tags/$_pkgver.tar.gz)
sha256sums=('ac314cd79c61a42c6c96c51682bc090773e10639cc2b4c2ed8a32648b5e3866a')

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
