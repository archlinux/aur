# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
_distname=Hook-AfterRuntime
pkgname=perl-hook-afterruntime
pkgver=0.006
pkgrel=1
pkgdesc="Run code at the end of the compiling scope's runtime"
arch=('any')
url="https://metacpan.org/release/$_distname"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.006' 'perl-b-hooks-parser>=0.09')
makedepends=()
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/P/PT/PTC/$_distname-$pkgver.tar.gz")
md5sums=('2e0b1b7617e158aa34a711ec57ae935b')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distname-$pkgver"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$_distname-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$_distname-$pkgver"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
