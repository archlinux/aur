# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
pkgname=perl-perlio-gzip
pkgver=0.20
pkgrel=1
pkgdesc="Perl extension to provide a PerlIO layer to gzip/gunzip"
arch=('i686' 'x86_64')
url='https://metacpan.org/pod/PerlIO::gzip'
license=('PerlArtistic' 'GPL')
depends=('perl>=0' 'zlib>=1:1.2.11')
makedepends=()
options=('!emptydirs')
source=('http://search.cpan.org/CPAN/authors/id/N/NW/NWCLARK/PerlIO-gzip-0.20.tar.gz')
md5sums=('0393eae5d0b23df6cf40ed44af7d711c')
_distdir="PerlIO-gzip-$pkgver"

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
