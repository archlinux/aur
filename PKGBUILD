# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=perl-pdf-tk
pkgver='0.02'
pkgrel='1'
pkgdesc="Perl integration for the pdf toolkit (pdftk)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.0' 'perl-io-all')
makedepends=()
url='https://metacpan.org/pod/PDF::Tk'
source=("https://cpan.metacpan.org/authors/id/M/MR/MRAMBERG/PDF-Tk-$pkgver.tar.gz")
sha512sums=('d1a235a5f62e5abbfbb912788f4fd7990595682f9c3b75114c23de07d4d84d563535c5df10054b6250839fa8b80043f93ae9790dd586797b36485f11007f13cc')
_distdir="PDF-Tk-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    ./Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ./Build test
}

package() {
  cd "$srcdir/$_distdir"
  ./Build install
}
