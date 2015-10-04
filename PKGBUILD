# Maintainer: gls <ghostlovescorebg at gmail dot com>

pkgname='perl-dancer'
pkgver='1.3142'
pkgrel='1'
pkgdesc="A minimal-effort oriented web application framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-runtime' 'perl-http-body>=1.07' 'perl-http-server-simple-psgi>=0.11' 'perl-libwww' 'perl-mime-types' 'perl-try-tiny>=0.09' 'perl-uri>=1.59' 'perl-xml-libxml' 'perl-hash-merge-simple')
makedepends=()
optdepends=('perl-yaml: YAML configuration files'
  	    'perl-template-toolkit: Template Toolkit rendering')
url='http://search.cpan.org/dist/Dancer'
source="http://search.cpan.org/CPAN/authors/id/Y/YA/YANICK/Dancer-${pkgver}.tar.gz"
md5sums=('3072888c96c377a25ac56334e011b953')
_dist='Dancer'

build() {

	cd "${srcdir}/${_dist}-${pkgver}"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	/usr/bin/perl Makefile.PL
	make

}

check() {

	cd "${srcdir}/${_dist}-${pkgver}"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	make test

}

package() {

	cd "${srcdir}/${_dist}-${pkgver}"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"

}

# vim:set ts=2 sw=2 et:
