# Maintainer: Sauliusl <luksaulius[at]gmail>
pkgname=chromasig-seq
pkgver=1.0
pkgrel=1
pkgdesc="ChromaSig is an unsupervised learning method to search for common patterns ("motifs") of histone modifications. Chromasig was proposed by Gary Hon et al"
url="http://wanglab.ucsd.edu/star/download.php"
arch=('x86_64' 'i686')
license=('unknown')
depends=('perl' 'swig' 'mysql' 'perl-math-cdf' 'perl-dbd-mysql')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=()
source=("http://tabit.ucsd.edu/download/ChromaSig.tar.gz")
sha1sums=('5ce0adc33dbc4c3f577a0476c5c5d5bea2b413f2')

build() {
	cd ${srcdir}/ChromaSig/ChromaSig-seq/
	sed -i 's/gmake/make/' install.ChromaSig 
	./install.ChromaSig # Ignore the name, this actually just builds it
}

package() {
	install -d ${pkgdir}/usr/lib/chromasig-seq/euclidean_dist/
	install -d ${pkgdir}/usr/lib/chromasig-seq/fast_pmf_cycle/
	install -d ${pkgdir}/usr/bin/
	cd ${srcdir}/ChromaSig/ChromaSig-seq/scripts
	install -Dm0755 euclidean_dist/*.so ${pkgdir}/usr/lib/chromasig-seq/euclidean_dist/
	install -Dm0644 euclidean_dist/*.o ${pkgdir}/usr/lib/chromasig-seq/euclidean_dist/
	install -Dm0644 euclidean_dist/*.pm ${pkgdir}/usr/lib/chromasig-seq/euclidean_dist/
	install -Dm0755 fast_pmf_cycle/*.so ${pkgdir}/usr/lib/chromasig-seq/fast_pmf_cycle/
	install -Dm0644 fast_pmf_cycle/*.o ${pkgdir}/usr/lib/chromasig-seq/fast_pmf_cycle/
	install -Dm0644 fast_pmf_cycle/*.pm ${pkgdir}/usr/lib/chromasig-seq/fast_pmf_cycle/

	sed -i 's/use lib "$FindBin::Bin/use lib "\/usr\/lib\/chromasig-seq/' ChromaSig.pl 

	install -Dm0755 *.pl ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et: