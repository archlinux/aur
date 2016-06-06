# Maintainer: Ganymede < ganymede _AT_ analogon _DOT_ eu>

pkgname=perl-file-libmagic
pkgver=1.15
pkgrel=3
pkgdesc="Determine MIME types of data or files using libmagic"
arch=('any')
url="http://search.cpan.org/~drolsky/File-LibMagic"
license=('GPL' 'PerlArtistic')
depends=('perl' 'file')
makedepends=('perl-test-fatal')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/File-LibMagic-$pkgver.tar.gz)
sha256sums=('2c7fb54912caf2c22d06b02d6a88edad970e0f8b017634dc30eec46e53763e84')

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
