# Maintainer : René Wagner <rwagner at rw-net dot de>

pkgname='perl-feed-find'
pkgver='0.13'
pkgrel='1'
pkgdesc="Perl interface for libcurl"
arch=('i686' 'x86_64')
license=('Artistic-2.0' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-test-lwp-useragent' 'perl' 'perl-module-install' 'perl-class-errorhandler')
url='https://metacpan.org/pod/Feed::Find'
source=("https://cpan.metacpan.org/authors/id/D/DA/DAVECROSS/Feed-Find-${pkgver}.tar.gz")
_distdir="Feed-Find-${pkgver}"

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
sha256sums=('39143f7e28ec3866fb124144a8c8d37ba6279029e9d33b521a00620ddfad8d07')
