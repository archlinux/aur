# Maintainer: Tyrolyean <tyrolyean@tyrolyean.net>

pkgname='perl-log-any-adapter-dispatch'
pkgver='0.08'
pkgrel='1'
pkgdesc="Adapter to use Log::Dispatch with Log::Any"
arch=('any')
license=('GPL-1.0')
options=('!emptydirs')
depends=('perl' 'perl-log-dispatch' 'perl-log-any')
makedepends=()
url='https://metacpan.org/pod/Log::Any::Adapter::Dispatch'
source=("https://cpan.metacpan.org/authors/id/P/PR/PREACTION/Log-Any-Adapter-Dispatch-${pkgver}.tar.gz")
md5sums=('7b6ae20138e1403e1c2f9af8c031226c')
sha512sums=('44d66c73329df28f526bdea71adb16b6c6440d8c551fe1ffd096f610d1cad9493857a7fefdd5ca2dbfa58b1fb0d409f1d9d2fd18b007a09eef70a736d3bc167f')
_distdir="Log-Any-Adapter-Dispatch-${pkgver}"

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
