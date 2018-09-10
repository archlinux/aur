# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: Mateusz Krasowski <matkras@gmail.com>
_distname=autobox-Core
pkgname=perl-autobox-core
pkgver=1.33
pkgrel=1
pkgdesc="Provide core functions to autoboxed scalars, arrays and hashes"
arch=('any')
url="https://metacpan.org/release/$_distname"
license=('PerlArtistic' 'GPL')
depends=('perl-want>=0.26' 'perl-autobox>=2.71')
makedepends=()
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/S/SW/SWALTERS/$_distname-$pkgver.tar.gz")
md5sums=('a7779011d27b04229ec912841ef40fff')

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
