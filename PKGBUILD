# CPAN Name  : Imager
# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Justin Davis <jrcd83@gmail.com>

pkgname=perl-imager
pkgver=1.019
pkgrel=2
pkgdesc='Perl extension for Generating 24 bit Images'
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'libjpeg' 'libpng' 'giflib' 'libtiff' 'freetype2')
optdepends=('perl-parse-recdescent: needed to parse transform2() expressions')
url="http://search.cpan.org/dist/Imager"
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TONYC/Imager-${pkgver}.tar.gz")
sha256sums=('74d44d701c1f14fc4b984fada1e955726b504c2d8b06d265e7a861fa5943cb48')

build() {
	cd "${srcdir}/Imager-${pkgver}"

	export PERL_MM_USE_DEFAULT="1" PERL5LIB="" \
	PERL_AUTOINSTALL="--skipdeps" \
	PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'"\
	PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
	MODULEBUILDRC="/dev/null"

	perl Makefile.PL
	make
}

check() {
	cd "${srcdir}/Imager-${pkgver}"

	export PERL_MM_USE_DEFAULT="1" PERL5LIB=""
	make test
}

package() {
	cd "${srcdir}/Imager-${pkgver}"

	make install
	find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

