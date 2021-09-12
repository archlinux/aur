# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-stream-buffered'
pkgver='0.03'
pkgrel='2'
pkgdesc="temporary buffer to save bytes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='https://metacpan.org/dist/Stream-Buffered'
source=("https://search.cpan.org/CPAN/authors/id/D/DO/DOY/Stream-Buffered-${pkgver}.tar.gz")
sha512sums=('cbc418846f61fd46163f85d2ce53c3d08ebc164a4e775b7e9fee4dc143daa3655983723099d1ded53f0054506c550038680d1f95e11d1399fef6ff6b38f9712e')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/Stream-Buffered-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/Stream-Buffered-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/Stream-Buffered-${pkgver}"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}