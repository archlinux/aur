# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_distname=X10
pkgname=perl-x10
pkgver=0.04
pkgrel=1
pkgdesc="Manage X10 devices in Perl"
arch=('any')
url="http://search.mcpan.org/dist/_distname"
license=('PerlArtistic' 'GPL')
depends=('perl-astro-suntime>=0.01'
         'perl-device-serialport'
         'perl-time-modules')
makedepends=()
options=('!emptydirs')
source=("http://search.mcpan.org/CPAN/authors/id/R/RO/ROBF/$_distname-$pkgver.tar.gz")
md5sums=('20dcca2dfb978bfed3043276aa3481e5')

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
