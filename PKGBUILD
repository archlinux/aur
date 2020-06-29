# maintainer: web.de jan.stuehler
_author="Phil M. Perry"
pkgname=perl-pdf-builder
pkgver=3.018
pkgrel=1
pkgdesc="Facilitates the creation and modification of PDF files"
arch=('any')
license=('LGPL')
options=('!emptydirs')
depends=()
url='https://metacpan.org/pod/PDF::Builder'
source=('https://cpan.metacpan.org/authors/id/P/PM/PMPERRY/PDF-Builder-3.018.tar.gz')
sha512sums=('da367aa520a0e779d70293ab3b270fc539d7467bfd7066bc2b7cc299bf018596dcd2859208368eb30ebcd3028321d141c41f8dc4b7913dc4fdc31f49c0533be5')
_distdir="PDF-Builder-3.018"

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
