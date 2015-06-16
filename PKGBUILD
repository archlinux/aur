# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-cpan-mini'
pkgver='1.111016'
pkgrel='1'
pkgdesc="create a minimal mirror of CPAN"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-homedir>=0.57' 'perl-uri' 'perl-libwww')
makedepends=()
url='http://search.mcpan.org/dist/CPAN-Mini'
source=('http://search.mcpan.org/CPAN/authors/id/R/RJ/RJBS/CPAN-Mini-1.111016.tar.gz')
md5sums=('1a6bb8f056f63266e1d6aeb7991b88ff')
sha512sums=('c5bc365efe95fb22c7e003246f8d1c508e57f8560f2293068b27b564ed246c5bd588733ddba1a994584102da695219c58d6589b366d782bcd7a7f6da194e538a')
_distdir="CPAN-Mini-1.111016"

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
