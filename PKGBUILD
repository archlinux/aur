# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-html-restrict'
pkgver='3.0.1'
pkgrel='1'
pkgdesc="Strip unwanted HTML tags and attributes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-dump' 'perl-moo>=1.002000' 'perl-namespace-clean' 'perl-scalar-list-utils>=1.33' 'perl-sub-quote' 'perl-type-tiny>=1.002001' 'perl-uri')
makedepends=('perl-test-fatal')
url='https://metacpan.org/pod/HTML::Restrict'
source=("https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTML-Restrict-v${pkgver}.tar.gz")
sha512sums=('ec56aec2d5eedb92ef1a980fa640197d9d26b7f278ce8d45227a53e2e5c015cb7694f1df369022c873b1e590c1f3c966867690c6085c2144ab74b9d70c26d13f')

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
