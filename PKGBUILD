# Maintainer: Simon Perry <pezz [at] sanxion [dot] net>

pkgname=perl-bigip-icontrol
pkgver=0.098
pkgrel=2
conflicts=('perl-icontrol')
replaces=('perl-icontrol')
pkgdesc="A Perl interface to the F5 iControl API"
depends=('perl>=5.10.0' 'perl-soap-lite')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/BigIP-iControl/"
source=(http://search.cpan.org/CPAN/authors/id/L/LT/LTP/BigIP-iControl-$pkgver.tar.gz)
options=('!emptydirs')
arch=(any)
sha256sums=('03d9aa2cd8f7132a6844bbac1e608ba4dd62a7a0f17726d1949f1072deda7156')

build()
{
  cd "${srcdir}/BigIP-iControl-$pkgver"

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
}

package()
{
  cd "${srcdir}/BigIP-iControl-${pkgver}"
  make DESTDIR=${pkgdir} install || return 1
  
  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete
}
# vim: ts=2 sw=2 et:
