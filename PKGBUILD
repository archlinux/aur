# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=perl-roman
pkgver='1.24'
pkgrel='1'
pkgdesc="Perl module for converting between Roman and Arabic numerals."
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl>=5.6.0')
makedepends=()
url='https://metacpan.org/pod/Roman'
source=("https://cpan.metacpan.org/authors/id/C/CH/CHORNY/Roman-$pkgver.tar.gz")
sha512sums=('82df0d817f55ad6a8fd467e92c97e27c07bd6cb04f0accb65468d6594d3e3ea545383f1c3763215d8c984cc31c808fe979c7d6c74dab1609ec822a9f256709e0')
_distdir="Roman-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}
