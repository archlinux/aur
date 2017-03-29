# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-pod-projectdocs'
pkgver='0.45'
pkgrel='1'
pkgdesc="generates CPAN like pod pages"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0' 'perl-class-data-inheritable>=0' 'perl-json>=2.04' 'perl-readonly>=0' 'perl-template-toolkit>=0' 'perl-uri>=0')
makedepends=()
url='https://metacpan.org/release/Pod-ProjectDocs'
source=('http://search.cpan.org/CPAN/authors/id/M/MG/MGRUNER/Pod-ProjectDocs-0.45.tar.gz')
md5sums=('798311787a9e64746088dd66a4863066')
sha512sums=('48293ba30805c24c35f1e72c8cea480a65d600bd60e95c8e57b29158c01dbc116cf6edaf9c2641fa2f6bd585dfec7d11f63281167f1bab7caa9c9bc884b273ae')
_distdir="Pod-ProjectDocs-0.45"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
