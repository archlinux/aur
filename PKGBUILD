# Maintainer: Rachel Mant <aur@dragonmux.network>
# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgbase=kicad-library-nightly
pkgname=('kicad-library-nightly' 'kicad-library-3d-nightly')
pkgver=8.0.0_rc2_96_gd50e0811fb
pkgrel=1
pkgdesc='KiCAD component and footprint libraries'
arch=('any')
url='http://kicad.org/'
license=('GPL')
makedepends=('git' 'cmake' 'make')
options=('!strip')
source=(
	'git+https://gitlab.com/kicad/libraries/kicad-symbols.git'#commit=8e17abb5
	'git+https://gitlab.com/kicad/libraries/kicad-footprints.git'#commit=aec88b587
	'git+https://gitlab.com/kicad/libraries/kicad-packages3D.git'#commit=ec7b609a
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

build_package()
{
	cd "$1"
	cmake . \
		-DCMAKE_INSTALL_PREFIX=/usr/lib/kicad-nightly \
		-DKICAD_DATA=/usr/share/kicad-nightly
	make
}

build()
{
	build_package "$srcdir/kicad-symbols"
	build_package "$srcdir/kicad-footprints"
	build_package "$srcdir/kicad-packages3D"
}

package_kicad-library-nightly()
{
	pkgdesc="Kicad component and footprint libraries"
	cd "$srcdir/kicad-symbols"
	make DESTDIR="$pkgdir" install
	cd "$srcdir/kicad-footprints"
	make DESTDIR="$pkgdir" install
}

package_kicad-library-3d-nightly()
{
	pkgdesc="Kicad 3D render model libraries"
	cd "$srcdir/kicad-packages3D"
	make DESTDIR="$pkgdir" install
}
