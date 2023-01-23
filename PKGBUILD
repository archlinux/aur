# Contributor: Dario Bosch <LastnameFirstname at gmail dot com>
# Maintainer: Liam TImms < timms5000 [at] gmail dot com >

pkgname=mrtrix3
pkgver=3.0.4
pkgrel=1
pkgdesc="tools for diffusion MRI analyses, data conversion and a viewer (mrview)"
arch=('x86_64')
url="https://github.com/MRtrix3/${pkgname}"
license=('MPL2')
depends=(
         # 'zlib' # already installed as dependency of python
         # 'qt5-base' # already installed as dependency of qt5-svg
         'qt5-svg'
         'python'
        )
optdepends=(
            'libtiff'
            'libpng'
            'fftw'
           )
makedepends=(
          'gcc'
          'git'
          'eigen'
)
provides=('mrtrix3')
conflicts=('mrtrix3')
source=("${pkgname}-${pkgver}::https://github.com/MRtrix3/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f1d1aa289cfc3e46e3a8eca93594b23d061c6d50a0cd03727433a7e2cd14f71a')

build() {
	cd "${pkgname}-${pkgver}"
	./configure
	./build
}

package() {
  	cd "${pkgname}-${pkgver}"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib"
  	cp -R ./bin/* "$pkgdir/usr/bin"
	cp -R ./lib/* "$pkgdir/usr/lib"
	chmod -R 755 "$pkgdir/usr/bin"
	chmod -R 755 "$pkgdir/usr/lib"
}
