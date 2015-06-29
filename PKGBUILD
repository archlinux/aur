# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: John Gerritse <reaphsharc@gmail.com>

pkgname=perl-svg
pkgver=2.59
pkgrel=2
pkgdesc="Perl extension for generating Scalable Vector Graphics (SVG) documents"
arch=(any)
url="http://search.cpan.org/dist/SVG/"
license=('perl')
makedepends=('perl-extutils-makemaker')
provides=("perl-svg-dom=${pkgver}" "perl-svg-element=${pkgver}" "perl-svg-extension=${pkgver}" "perl-svg-manual=${pkgver}" "perl-svg-xml=${pkgver}")
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/S/SZ/SZABGAB/SVG-${pkgver}.tar.gz")
sha256sums=('e1e60e590718c2de5bda17a76283fdeb137761b69da2121c03d9630257e8ba3a')

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

