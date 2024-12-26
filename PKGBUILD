# Maintainer: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=mrcal
pkgver=2.4.1
pkgrel=1
pkgdesc="mrcal is a generic toolkit built to solve the calibration and SFM-like problems we encounter at NASA/JPL."
arch=('i686' 'x86_64')
url="http://mrcal.secretsauce.net/"
license=('Apache-2.0')
depends=('libdogleg'
         'python'
         'python-numpy'
         'python-numpysane'
         'python-scipy'
         'python-opencv'
         'python-shapely'
         'python-matplotlib'
         'python-gnuplotlib'
         'python-yaml'
         'freeimage')
makedepends=('make' 'gcc' 'perl-list-moreutils' 're2c' 'mrbuild' 'python-numpy')
optdepends=('mrgingham')
provides=('mrcal')
conflicts=('mrcal')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dkogan/mrcal/archive/refs/tags/v${pkgver}.tar.gz"
	"https://salsa.debian.org/science-team/mrcal/-/raw/master/debian/patches/0001-I-initialize-the-Python-extension-type-in-a-more-cor.patch"
	"https://salsa.debian.org/science-team/mrcal/-/raw/master/debian/patches/0002-autodiff.hh-I-explicitly-prevent-all-the-symbols-fro.patch"
	"numpy2.patch")

sha256sums=('74c746bf74ed61e2eb5766f403f7f35d4b5d793020dfbc185113a6e929457531'
            'dbc4e5aeaa98397dc99df877dc959afc23eec8dfe2844b55e7f5062e8f2f3e10'
            '865c983f45f6d1e189be99116044a3349a6c7af8548809c877d4f2702bb5123f'
            'SKIP')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -Np1 -i "${srcdir}/0001-I-initialize-the-Python-extension-type-in-a-more-cor.patch"
	patch -Np1 -i "${srcdir}/0002-autodiff.hh-I-explicitly-prevent-all-the-symbols-fro.patch"
	patch -Np1 -i "${srcdir}/numpy2.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	CFLAGS=`numpy-config --cflags`
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install
}
