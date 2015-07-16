# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: John Gerritse <reaphsharc@gmail.com>

pkgname=perl-svg
pkgver=2.64
pkgrel=1
pkgdesc='Perl extension for generating Scalable Vector Graphics (SVG) documents'
arch=('any')
url='http://search.cpan.org/dist/SVG/'
license=('perl')
makedepends=('perl-extutils-makemaker')
provides=("perl-svg-dom=${pkgver}"
	"perl-svg-element=${pkgver}"
	"perl-svg-extension=${pkgver}"
	"perl-svg-xml=${pkgver}")
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/S/SZ/SZABGAB/SVG-${pkgver}.tar.gz")
sha256sums=('73d1e1e79f6cc04f976066e70106099df35be5534eceb5dfd2c1903ecf994acd')

build() {
	cd SVG-${pkgver}/

	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

package() {
	cd SVG-${pkgver}/

	make install DESTDIR="${pkgdir}"

	# remove perllocal.pod and .packlist
	find ${pkgdir} -name perllocal.pod -delete
	find ${pkgdir} -name .packlist -delete
}

