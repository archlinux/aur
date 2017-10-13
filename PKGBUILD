# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-test-www-mechanize'
_pkgname='Test-WWW-Mechanize'
pkgver='1.48'
pkgrel='1'
pkgdesc="Testing-specific WWW::Mechanize subclass"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-carp-assert-more' 'perl-html-parser' 'perl-html-tree' 'perl-http-server-simple>=0.42' 'perl-libwww' 'perl-test-longstring>=0.15' 'perl-uri' 'perl-www-mechanize>=1.68')
makedepends=('perl-cgi')
url='http://search.cpan.org/dist/Test-WWW-Mechanize'
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/${_pkgname}-${pkgver}.tar.gz")
md5sums=('187d487b8ad71f8c94916365b7ad28ac')
sha512sums=('90a1d365479245d159ba7aa954bb01b617f1526423a00b41f3347e0e708a3eb79f0ba5a20315e74032d817154e52ef6178571528bcc183e38a9c53577ef8235d')

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
