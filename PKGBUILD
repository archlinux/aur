# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-html-restrict'
pkgver='2.1.9'
pkgrel='1'
pkgdesc="Strip unwanted HTML tags and attributes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-dump>=0' 'perl-html-parser>=0' 'perl-list-moreutils>=0' 'perl-moo>=1.002000' 'perl-moox-types-mooselike>=0.23' 'perl-uri>=0' 'perl-namespace-clean>=0')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='https://metacpan.org/pod/HTML::Restrict'
source=("http://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/HTML-Restrict-2.1.9.tar.gz")
sha512sums=('ae915bf45439bc5f05240340873ec412b8647b51901adc67e6af9984f3fe3312952afae51f61613eb1902b2ef1c6d71b9fef2a3f65b40c66852f1766d521d748')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/HTML-Restrict-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
