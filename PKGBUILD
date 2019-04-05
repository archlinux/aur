# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Drew Gilbert <gilbert dot drew at gmail dot com>

pkgname=perl-net-upnp
pkgver=1.4.6
pkgrel=1
pkgdesc="Perl Module UPnP"
arch=('x86_64')
url="https://metacpan.org/release/Net-UPnP"
license=('BSD' 'PerlArtistic')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/S/SK/SKONNO/Net-UPnP-$pkgver.tar.gz")
depends=('perl')
sha256sums=('10ae135a8f72d399501166bc697a3b300fb739a6614aa54408e4e08bec1e91dc')

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
