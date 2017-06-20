pkgname=perl-browser-open
pkgver=0.04
pkgrel=1
pkgdesc="XS implementation of parts of Class::Load"
arch=('i686' 'x86_64')
license=('PerlArtistic2')
options=('!emptydirs')
depends=('perl')
url="http://search.cpan.org/dist/Browser-Open/"
source=("http://search.cpan.org/CPAN/authors/id/C/CF/CFRANKS/Browser-Open-$pkgver.tar.gz")
sha512sums=('70f5559c4dd4a07ed8513340871a2c04b2c4118b8f160e23586fc170d5f9123ab287d6031860096ca6329c03df8f077d96f0af2656efe46a9b1629d92255e7ae')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/Browser-Open-${pkgver}"
  perl Makefile.PL
  make
}
check() {
  cd "${srcdir}/Browser-Open-${pkgver}"
  make test
}
package() {
  cd "${srcdir}/Browser-Open-${pkgver}"
  make install
}
