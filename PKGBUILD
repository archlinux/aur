# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-www-wikipedia
pkgver=2.01
pkgrel=1
pkgdesc="Automated interface to the Wikipedia"
depends=('perl>=5.10.0' 'perl-text-autoformat' 'perl-libwww')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/WWW-Wikipedia"
source=(http://search.cpan.org/CPAN/authors/id/B/BR/BRICAS/WWW-Wikipedia-${pkgver}.tar.gz)
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/WWW-Wikipedia-${pkgver}

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
}

package()
{
  cd ${srcdir}/WWW-Wikipedia-${pkgver}

  make DESTDIR=${pkgdir} install || return 1
  
  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete
}
md5sums=('68a5f07f2add4e5a8aa591c24aa6fa75')
