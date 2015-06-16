# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-poe-filter-ircd
pkgver=2.44
pkgrel=2
pkgdesc="A POE-based parser for the IRC protocol"
depends=('perl>=5.10.0' 'glibc' 'perl-poe')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/POE-Filter-IRCD/"
source=(http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/POE-Filter-IRCD-${pkgver}.tar.gz)
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/POE-Filter-IRCD-${pkgver}

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
}

package()
{
  cd ${srcdir}/POE-Filter-IRCD-${pkgver}

  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete
}

md5sums=('7e2ba13c41760b95504f13b5b8636e86')
