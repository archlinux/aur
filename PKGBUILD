# Maintainer: robertfoster

pkgname=perl-ip-country
pkgver=2.28
pkgrel=3
pkgdesc="lookup of country codes by IP address"
arch=('any')
license=('PerlArtistic2')
options=('!emptydirs')
depends=('perl')
url="http://search.cpan.org/dist/IP-Country/"
source=("http://search.cpan.org/CPAN/authors/id/N/NW/NWETTERS/IP-Country-$pkgver.tar.gz"
  "http://mailfud.org/ip-country-fast/ip.gif"
  "http://mailfud.org/ip-country-fast/cc.gif")
sha256sums=('88db833a5ab22ed06cb53d6f205725e3b5371b254596053738885e91fa105f75'
            '98ad6772ff178c33756887b92af81d00157f358e1aab79bc261cd2c20c4b4417'
            'df254ef278d81076c4aeb7e67be0eba2ee2e9c24950d903c1dcc1127e3ce86da')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/IP-Country-${pkgver}"
  perl Makefile.PL
  make
}
check() {
  cd "${srcdir}/IP-Country-${pkgver}"
  make test
}
package() {
  cd "${srcdir}/IP-Country-${pkgver}"
  make install
  install -Dm0644 "$srcdir/ip.gif" "$pkgdir/usr/share/perl5/vendor_perl/IP/Country/Fast/ip.gif"
  install -Dm0644 "$srcdir/cc.gif" "$pkgdir/usr/share/perl5/vendor_perl/IP/Country/Fast/cc.gif"
}
