# $Id: PKGBUILD 310007 2017-11-15 14:11:34Z foutrelis $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Drew Gilbert <gilbert dot drew at gmail dot com>

pkgname=perl-net-upnp
pkgver=1.4.3
pkgrel=3
pkgdesc="Perl Module UPnP"
arch=('x86_64')
url="http://search.cpan.org/~skonno/Net-UPnP-1.4.3/"
license=('BSD' 'PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/S/SK/SKONNO/Net-UPnP-${pkgver}.tar.gz")
depends=('perl')
md5sums=('a30d7cc54290946aeb028650cfdc9279')

build() {
  cd "${srcdir}/Net-UPnP-${pkgver}"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor 
  make
}

check() {
  cd "${srcdir}/Net-UPnP-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Net-UPnP-${pkgver}"

  make install DESTDIR="${pkgdir}"
  
  # install license file
  install -Dm644 "README" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
