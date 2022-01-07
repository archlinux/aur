# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: John Gerritse <reaphsharc@gmail.com>

pkgname=perl-svg
pkgver=2.86
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
source=("${pkgname}-${pkgver}.tar.gz::http://search.cpan.org/CPAN/authors/id/M/MA/MANWAR/SVG-${pkgver}.tar.gz")
sha256sums=('72c6eb6f86bb2c330280f9f3d342bb2673ad5da22d1f44fba3e04cfb5d30a67b')

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

