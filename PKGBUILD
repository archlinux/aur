# Contributor: Manifest0
pkgname=perl-extutils-install
pkgver=2.14
pkgrel=1
pkgdesc='ExtUtils::Install - install files from here to there'
_dist='ExtUtils-Install'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/B/BI/BINGOS/$_dist-$pkgver.tar.gz")
md5sums=('ae6af2689daa6f8c2d01d04a28ab0ef0')
sha512sums=('10f8b7e8bbd11c0860c9df72f8eb074eb329f889707788c7a1e81463022e4366173fa2681ddcb9c61514a075ddf3a63534a4758b47b259c84948bc633ddd78f5')


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
