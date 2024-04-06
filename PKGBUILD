# Maintainer: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=mrcal
pkgver=2.4
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
makedepends=('make' 'gcc' 'perl-list-moreutils' 're2c' 'mrbuild')
optdepends=('mrgingham')
provides=('mrcal')
conflicts=('mrcal')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dkogan/mrcal/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('c4dc1d2c0780e60c299f8a8d7767717ea977d9b8cf6a476795bf87bbc16316f8')
sha512sums=('7fb85b854edece048ea545a87b7a8effb78ea00a350038140a13f06e352bc9f85de39df1153a55f822d39bbe9c52efccc988a419c87b899d007e7f1aa1f51bdf')
b2sums=('9f231d59ba04db8621eeccf83d1f419b86804c242eb04b6dc319af1200028af9d48fac188d5a74b77e84468aebfa777256bcbf363db404676f64842656ee6d3b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	CFLAGS=`python-config --includes | awk '{n=split($2,a,"|");for(i=1;i<=n;++i)if(!seen[a[i]]++)print a[i]}' | sed 's!/usr/include!/usr/lib!' | sed 's!$!/site-packages/numpy/core/include!'`
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install
}
