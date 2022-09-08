# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname='perl-pod-projectdocs'
pkgver='0.53'
pkgrel='3'
pkgdesc="generates CPAN like pod pages"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json' 'perl-readonly' 'perl-template-toolkit' 'perl-html-parser' 'perl-moose' 'perl')
url='https://metacpan.org/release/Pod-ProjectDocs'
source=("https://search.cpan.org/CPAN/authors/id/M/MG/MGRUNER/Pod-ProjectDocs-${pkgver}.tar.gz")
md5sums=('456961beea93816d74975a3c39710a37')
sha512sums=('6335031ce3223295d8f39ab98a7d413fa050cb36c4ef4cea6c88d6e29fc445948eab09e51b2fbfbc09d35c1e6b3077444098a2ba49ca8f0e33fd764969054221')
_distdir="Pod-ProjectDocs-${pkgver}"

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
