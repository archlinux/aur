# Maintainer: Rachel Mant <aur@dragonmux.network>
# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgbase=kicad-library-nightly
pkgname=('kicad-library-nightly' 'kicad-library-3d-nightly')
pkgver=7.99.0_1823_ga38875d6dd
pkgrel=1
pkgdesc='KiCAD component and footprint libraries'
arch=('any')
url='http://kicad.org/'
license=('GPL')
makedepends=('git' 'cmake' 'make')
options=('!strip')
source=(
	'git+https://gitlab.com/kicad/libraries/kicad-symbols.git'#commit=f1c664ca
	'git+https://gitlab.com/kicad/libraries/kicad-footprints.git'#commit=2c6f52c7b
	'git+https://gitlab.com/kicad/libraries/kicad-packages3D.git'#commit=8a2c5c4c
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
