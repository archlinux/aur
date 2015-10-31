# CPAN Name : Statistics-OnLine
# Maintainer: Rafael Reggiani Manzo
# Temaplte  : CPANPLUS::Dist::Arch

pkgname=perl-statistics-online
pkgver=0.02
pkgrel=1
pkgdesc="Pure Perl implementation of the on-line algorithm to produce statistics"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=()
makedepends=()
url='http://search.cpan.org/~nids/Statistics-OnLine-0.02/lib/Statistics/OnLine.pm'
source=('http://search.cpan.org/CPAN/authors/id/N/NI/NIDS/Statistics-OnLine-0.02.tar.gz')
sha512sums=('3b4455209b732b2871408e6eb0102d6a4fb9b2855701ea8f7a17e732d43ef32dfe0ebd6e05e0d67593e31d8c090329a8f0275700ca0d2db815987da702a6b86d')
_distdir="Statistics-OnLine"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir-$pkgver"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir-$pkgver"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
