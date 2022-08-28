# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
pkgname='perl-moosex-setonce'
pkgver='0.201'
pkgrel='1'
epoch='1'
pkgdesc="write-once, read-many attributes for Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose')
checkdepends=('perl-test-fatal')
url='https://metacpan.org/release/MooseX-SetOnce'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/MooseX-SetOnce-0.201.tar.gz')
md5sums=('3e2d450e32f910e24dbeb7ed59b4e79e')
_distdir="MooseX-SetOnce-0.201"

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
