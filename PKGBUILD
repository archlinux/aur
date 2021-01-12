# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >

pkgname='perl-html-clean'
pkgver='1.4'
pkgrel='1'
pkgdesc="Cleans up HTML code for web browsers, not humans"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='https://metacpan.org/release/HTML-Clean'
source=(https://cpan.metacpan.org/authors/id/A/AZ/AZJADFTRE/HTML-Clean-${pkgver}.tar.gz)
sha512sums=('a675b2ae0f7472d4fe44d3402687c4a7d87d33b30894e2c1d9639552fa5f58a89b35b52be17f95058a5ce690a996451c877d1c723b9b6f3919f437da8d458004')
_distdir="HTML-Clean-$pkgver"

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
