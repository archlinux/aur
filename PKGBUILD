# Maintainer: izmntuk
pkgname=perl-compress-zlib
_realname=Compress-Zlib
pkgver=2.015
pkgrel=1
pkgdesc="Perl interface to zlib compression library"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
options=(!emptydirs)
#http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/Compress-Zlib-2.015.tar.gz
source=(http://www.cpan.org/authors/id/P/PM/PMQS/${_realname}-${pkgver}.tar.gz)
replaces=('compress-zlib')
provides=('compress-zlib')
md5sums=('689ba2cc399b019d0bf76a0575c32947')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make install DESTDIR=${pkgdir}

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
