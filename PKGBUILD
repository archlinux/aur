# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=thunk_gen
pkgver=1.11
pkgrel=1
pkgdesc='Thunk generator for C and assembler code.'
url="https://github.com/stsp/${pkgname}"
license=('GPL-3.0-or-later')
depends=()
makedepends=('git' 'meson' 'ninja')
arch=('any')
sha256sums=('579f8bc5a6d090495a30ac6ac090bf62ce5633c1fbfefb1f087367d02970456a')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

_srcdir="${pkgname}-${pkgver}"

build() {
	arch-meson "$_srcdir" 'build'
	meson compile -C 'build'
}

package() {
	depends+=('python-ply')
	meson install -C 'build' --destdir="$pkgdir"
	install -Dm644 "$_srcdir/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
