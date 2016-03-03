# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-nginx'
pkgver='0.25'
pkgrel='1'
pkgdesc="Data-driven test scaffold for Nginx C module and OpenResty Lua library development"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-message>=0' 'perl-list-moreutils>=0' 'perl-test-base>=0' 'perl-test-longstring>=0' 'perl-text-diff>=0' 'perl-uri>=0' 'perl-libwww>=0' 'perl>=5.6.1')
makedepends=()
url='https://metacpan.org/release/Test-Nginx'
source=("http://search.cpan.org/CPAN/authors/id/A/AG/AGENT/Test-Nginx-$pkgver.tar.gz")
md5sums=('0e8ffc428748277c656b55d24eeb1a65')
sha512sums=('2a78dd22fa6661314e525bd9ae5bccca0f287713064a2e934422465b334adc4226a33a773d23606b38f1ea7f349fa6f233c2aade18e885553050b532adcfbedc')
_distdir="Test-Nginx-$pkgver"

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
