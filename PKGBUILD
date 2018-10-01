# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Drew Gilbert <gilbert dot drew at gmail dot com>

pkgname=perl-net-upnp
pkgver=1.4.4
pkgrel=1
pkgdesc="Perl Module UPnP"
arch=('x86_64')
url="http://search.cpan.org/~skonno/Net-UPnP-1.4.4/"
license=('BSD' 'PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/S/SK/SKONNO/Net-UPnP-${pkgver}.tar.gz")
depends=('perl')
sha256sums=('6161340fdeedc3014dd90acd892b001b58b8ff37cf56b12998b5ed62add0a0d8')

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
