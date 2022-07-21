# Maintainer: Liam Timms <timms5000 at gmail dot com>
# Contributor: Dario Bosch <LastnameFirstname at gmail dot com>

_pkgname='mrtrix3'
pkgname="${_pkgname}-git"
pkgver=3.0.3.r105.gd3941f443
pkgrel=1
pkgdesc="tools for diffusion MRI analyses, data conversion and a viewer (mrview)"
arch=('x86_64')
url="https://github.com/MRtrix3/${_pkgname}"
license=('MPL2')
depends=('qt5-svg' 'python')
optdepends=('libtiff' 'fftw')
makedepends=('gcc' 'git' 'eigen')
provides=('mrtrix3')
conflicts=('mrtrix3')
source=("${pkgname}::git+https://github.com/MRtrix3/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}"
	./configure
	./build
}

package() {
  	cd "${pkgname}"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib"
  	cp -R ./bin/* "$pkgdir/usr/bin"
	cp -R ./lib/* "$pkgdir/usr/lib"
	chmod -R 755 "$pkgdir/usr/bin"
	chmod -R 755 "$pkgdir/usr/lib"
}

