# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-dbix-simple'
pkgver='1.37'
pkgrel='1'
pkgdesc="Very complete easy-to-use OO interface to DBI"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi')
makedepends=()
url='http://search.mcpan.org/dist/DBIx-Simple'
source=('http://search.mcpan.org/CPAN/authors/id/J/JU/JUERD/DBIx-Simple-1.37.tar.gz')
md5sums=('eb53ef4a93be7ebf043cd49075e81913')
_distdir="DBIx-Simple-1.37"

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
