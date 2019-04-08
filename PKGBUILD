pkgname=perl-perlio-via-gzip
_dist=PerlIO-via-gzip
pkgver=0.03
pkgrel=1
pkgdesc="Perl extension PerlIO::via::gzip"
arch=('any')
url='https://metacpan.org/pod/PerlIO::via::gzip'
license=('PerlArtistic' 'GPL')
depends=('perl' 'zlib')
makedepends=()
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MA/MAJENSEN/${_dist}-${pkgver}.tar.gz")
sha256sums=('b4c101ea2c2d7219f8880e51d3962384aafbc30cb0871ef9dbd57c09f17d4d8b')


build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
