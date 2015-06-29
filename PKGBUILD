# CPAN Name  : CGI-SSI
# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=perl-cgi-ssi
pkgver=0.92
pkgrel=3
pkgdesc="CGI-SSI (Server Side Includes) for Perl"
arch=('any')
url="http://search.cpan.org/~james/CGI-SSI-${pkgver}/"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-cgi' 'perl-html-simpleparse')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/J/JA/JAMES/CGI-SSI-${pkgver}.tar.gz")
sha256sums=('162ba39a723b09cff925e5e61604e3614bdb19363f2bb434cf33187e6b472e2c')

build() {
	cd "${srcdir}/CGI-SSI-${pkgver}"

	export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1

	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "${srcdir}/CGI-SSI-${pkgver}"

	make test
}

package() {
	cd "${srcdir}/CGI-SSI-${pkgver}"

	make DESTDIR="${pkgdir}" install

	find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

