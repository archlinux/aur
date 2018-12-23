# Maintainer: Ganymede < ganymede _AT_ analogon _DOT_ eu>

pkgname=perl-file-libmagic
pkgver=1.16
pkgrel=1
pkgdesc="Determine MIME types of data or files using libmagic"
arch=('any')
url="https://metacpan.org/release/File-LibMagic"
license=('GPL' 'PerlArtistic')
depends=('perl' 'file')
makedepends=('perl-test-fatal')
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/D/DR/DROLSKY/File-LibMagic-$pkgver.tar.gz)
sha256sums=('c8a695fac1454f52e18e2e1b624c0647cf117326014023dda69fa3e1a5f33d60')

build() {
  cd "$srcdir/File-LibMagic-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/File-LibMagic-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/File-LibMagic-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
