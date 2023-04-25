# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-html-restrict'
pkgver='3.0.2'
pkgrel='1'
pkgdesc="Strip unwanted HTML tags and attributes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-dump' 'perl-html-parser' 'perl-moo>=1.002000' 'perl-namespace-clean' 'perl-scalar-list-utils>=1.33' 'perl-sub-quote' 'perl-type-tiny>=1.002001' 'perl-uri')
makedepends=('perl-test-fatal')
url='https://metacpan.org/pod/HTML::Restrict'
source=("https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTML-Restrict-v${pkgver}.tar.gz")
sha512sums=('eaa831a00d310ea66dfc7d90e3406285fc0c02b22ed8b676fbe6d0d6a313897b2b7f7c1ea64ee906e5fd539539edc23972e86bdd4482c98c577e19f8519ef78b')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/HTML-Restrict-v${pkgver}"
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
