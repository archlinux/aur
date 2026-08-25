# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Domain-PublicSuffix'
_modnamespace=Domain
pkgname=perl-domain-publicsuffix
pkgver=0.21
pkgrel=1
pkgdesc="Parse a domain down to root"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl' 'perl-class-accessor-fast' 'perl-net-idn-encode')
options=('!emptydirs')
source=("https://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('d0903e7c6385b932dd0f537b584b8884111b9356e5fe44f3a9fc6310ce5c300d')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
