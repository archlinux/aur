# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-test-www-mechanize-catalyst'
_pkgname='Test-WWW-Mechanize-Catalyst'
pkgver='0.58'
pkgrel='2'
pkgdesc="Test::WWW::Mechanize for Catalyst"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-catalyst-plugin-session' 'perl-catalyst-plugin-session-state-cookie' 'perl-catalyst-runtime>=5.00' 'perl-libwww>=5.816' 'perl-moose>=0.67' 'perl-namespace-clean>=0.09' 'perl-test-exception' 'perl-test-www-mechanize>=1.14' 'perl-www-mechanize>=1.54')
makedepends=('perl-test-utf8')
url='http://search.cpan.org/dist/Test-WWW-Mechanize-Catalyst'
source=("http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/${_pkgname}-${pkgver}.tar.gz")
md5sums=('590f6a22d70aa952d4af3e622b0a6c91')
sha512sums=('fec87d1cb6fb3cffed7e524fa970a817bcd518d37138bc2cecc3c69e8aab421263a29f08d14f4804e585469f0dce20fa9b96de3adff8fc010699928b8d1f7e3f')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
