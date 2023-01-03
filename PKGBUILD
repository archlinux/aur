# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_distname=CPAN-Uploader
pkgname=perl-cpan-uploader
pkgver=0.103017
pkgrel=1
pkgdesc="upload things to the CPAN"
arch=('any')
url="https://metacpan.org/release/$_distname"
license=('PerlArtistic' 'GPL')
depends=('perl-getopt-long-descriptive'
         'perl-http-message'
         'perl-lwp-protocol-https'
         'perl-term-readkey')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/$_distname-$pkgver.tar.gz")
md5sums=('e3a1f7a85f247f6f28dd77645992fab0')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distname-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distname-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distname-$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
