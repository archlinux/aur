# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: John Gerritse <reaphsharc@gmail.com>

pkgname=perl-svg
pkgver=2.87
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
sha256sums=('b3fa58c1c59942b4ebef003da97c3e01e531480ca29e8efbe327ff0589c0bd3c')

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

