# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
pkgname=perl-moosex-undeftolerant
pkgver=0.21
pkgrel=1
pkgdesc="Make your attribute(s) tolerant to undef initialization"
arch=('any')
url='https://metacpan.org/pod/MooseX::UndefTolerant'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.006' 'perl-moose>=0.89' 'perl-namespace-autoclean>=0')
makedepends=()
checkdepends=('perl-moose>=0' 'perl-test-fatal>=0')
options=('!emptydirs')
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-UndefTolerant-0.21.tar.gz')
md5sums=('8dbeb476c37ed546df210cc58310020d')
_distdir="MooseX-UndefTolerant-$pkgver"

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

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
