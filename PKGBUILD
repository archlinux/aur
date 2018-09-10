# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: chimeracoder <dev@chimeracoder.net>
_distname=autobox
pkgname=perl-autobox
pkgver=3.0.1
pkgrel=1
pkgdesc="call methods on native types"
arch=('x86_64')
url="https://metacpan.org/release/$_distname"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.0' 'perl-ipc-system-simple>=1.25' 'perl-scope-guard>=0.21')
makedepends=()
checkdepends=('perl-test-fatal>=0.014')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/C/CH/CHOCOLATE/$_distname-v$pkgver.tar.gz")
md5sums=('7b2fce96b3ad20924555130ab9847b95')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distname-v$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distname-v$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distname-v$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
