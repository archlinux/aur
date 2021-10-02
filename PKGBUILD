# Maintainer : René Wagner <rwagner at rw-net dot de>

pkgname='perl-feed-find'
pkgver='0.11'
pkgrel='1'
pkgdesc="Perl interface for libcurl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-lwp-useragent' 'perl')
url='https://metacpan.org/pod/Feed::Find'
source=("https://cpan.metacpan.org/authors/id/D/DA/DAVECROSS/Feed-Find-${pkgver}.tar.gz")
sha256sums=('0c1f101fbd13546ae6da376063053e602f912d5a3b2c4f0a262d569365f3d595')
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
