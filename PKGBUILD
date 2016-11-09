# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-pdl-stats'
pkgver='0.75'
pkgrel='1'
pkgdesc="a collection of statistics modules in Perl Data Language, with a quick-start guide for non-PDL people."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-pdl>=0')
makedepends=()
url='https://metacpan.org/release/PDL-Stats'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETJ/PDL-Stats-0.75.tar.gz')
md5sums=('84f610c281142117c350c6f784002bc8')
sha512sums=('6a84aebc63b3d99ccb748f04569c8fd1303dc2f35effa6acee7d700e09496cab3fd0c4a130d4b05c92cd1c7feb6f78fa47a37046207b7b677a2e1dd520512ccc')
_distdir="PDL-Stats-0.75"

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
