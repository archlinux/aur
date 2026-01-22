# Maintainer: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=mrcal
pkgver=2.5.1
pkgrel=1
pkgdesc="A generic toolkit built to solve the calibration and SFM-like problems we encounter at NASA/JPL."
arch=('i686' 'x86_64')
url="http://mrcal.secretsauce.net/"
license=('Apache-2.0')
depends=('libdogleg'
         'libjpeg'
         'libpng'
         'lapack'
         'python'
         'python-numpy'
         'python-numpysane'
         'python-scipy'
         'python-opencv'
         'ipython'
         'python-shapely'
         'python-matplotlib'
         'python-gnuplotlib'
         'gcc-libs'
         'glibc'
         'python-yaml')
makedepends=(
    'make'
    'gcc'
    'perl-list-moreutils'
    're2c'
    'mrbuild'
    'python-numpy'
    'stb'
)
optdepends=('mrgingham')
provides=('mrcal')
conflicts=('mrcal')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dkogan/mrcal/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('20e2bf89fe158693996283aa873b0b6ea4d2f9266bcfb39d51541962d23abc2d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export CFLAGS=`numpy-config --cflags`
	export USE_LOCAL_STB_IMPLEMENTATION=1
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install
}
