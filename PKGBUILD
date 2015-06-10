# Maintainer: Simon Perry <pezz [at] sanxion [dot] net>

pkgname=perl-bigip-icontrol
pkgver=0.097
pkgrel=1
conflicts=('perl-icontrol')
replaces=('perl-icontrol')
pkgdesc="A Perl interface to the F5 iControl API"
depends=('perl>=5.10.0' 'perl-soap-lite')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/BigIP-iControl/"
source=(http://search.cpan.org/CPAN/authors/id/L/LT/LTP/BigIP-iControl-$pkgver.tar.gz)
options=('!emptydirs')
arch=(any)
sha256sums=('bd3e73bc2a17df5bf01a7d39ad8e99f508dd89394ed3bafda5a98b7f0b38f914')

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
