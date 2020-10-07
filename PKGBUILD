# Maintainer : <michael dot kogan at gmx dot net>

pkgname='perl-filter-signatures'
pkgver='0.17'
pkgrel='1'
pkgdesc="Filter::signatures - very simplistic signatures for Perl < 5.20"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.0' 'perl-filter-simple')
makedepends=()
optdepends=()
url='https://metacpan.org/pod/Filter::signatures'
source=("https://cpan.metacpan.org/authors/id/C/CO/CORION/Filter-signatures-$pkgver.tar.gz")
md5sums=('139102fa7e09cbef24cf5fcbf7e78788')
_distdir="Filter-signatures-$pkgver"

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