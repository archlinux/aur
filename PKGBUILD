pkgname=perl-ip-country
pkgver=2.28
pkgrel=2
pkgdesc="lookup of country codes by IP address"
arch=('any')
license=('PerlArtistic2')
options=('!emptydirs')
depends=('perl')
url="http://search.cpan.org/dist/IP-Country/"
source=(http://search.cpan.org/CPAN/authors/id/N/NW/NWETTERS/IP-Country-$pkgver.tar.gz
	http://mailfud.org/ip-country-fast/ip.gif
	http://mailfud.org/ip-country-fast/cc.gif)
sha256sums=('88db833a5ab22ed06cb53d6f205725e3b5371b254596053738885e91fa105f75'
            'b10ff96c295ba882c85f3a53562958d2e3d275f1501f834e377bcff4a05fa8c0'
            '4f3376def1e27fa40a93116ebb35c12763fc100c27c10038af7f512551c4e7f2')

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
