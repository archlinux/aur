# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: sL1pKn07 <sl1pkn07@gmail.com>
_distname=Test-use-ok
pkgname=perl-test-use-ok
pkgver=0.11
pkgrel=4
pkgdesc="Alternative to Test::More::use_ok"
arch=('any')
url="http://search.mcpan.org/dist/$_distname"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.8.9')
makedepends=('')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/A/AU/AUDREYT/$_distname-$pkgver.tar.gz")
md5sums=('014364cc2f0df651d8416ebb60451f18')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distname-$pkgver"
    /usr/bin/perl -I. Makefile.PL
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
