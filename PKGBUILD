# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_distname=Astro-SunTime
pkgname=perl-astro-suntime
pkgver=0.06
pkgrel=2
pkgdesc="Get Sun Rise and Set Times for any location on the globe"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-time-modules')
options=('!emptydirs')
url="https://metacpan.org/release/$_distname"
source=("http://search.cpan.org/CPAN/authors/id/R/RO/ROBF/$_distname-$pkgver.tar.gz")
md5sums=('42cb8c94de8a111ed652196925c22a45')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distname-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distname-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distname-$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
