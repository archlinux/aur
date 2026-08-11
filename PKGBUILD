# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-extutils-makemaker-cpanfile'
pkgver='0.11'
pkgrel='1'
pkgdesc="cpanfile support for EUMM"
arch=('any')
license=('Artistic-1.0-Perl'
         'GPL-1.0-only')
options=('!emptydirs')
depends=('perl-module-cpanfile>=0')
url='https://metacpan.org/release/ExtUtils-MakeMaker-CPANfile'
source=("http://search.cpan.org/CPAN/authors/id/I/IS/ISHIGAKI/ExtUtils-MakeMaker-CPANfile-${pkgver}.tar.gz")
sha512sums=('59388b8e4e44e02b15eddff5e59047cd23326c4ae534cf02e3e4eb26d0df31ca9cbfadf1add3f0dc2e49f6f9da97bc66c3665f82cf4bb36bbcd00a272466fa79')
_distdir="ExtUtils-MakeMaker-CPANfile-${pkgver}"

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
