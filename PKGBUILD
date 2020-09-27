# Maintainer: Jimmy Xu <me at jimmyxu dot org>
# Contributor: Kent Fredric <kentnl at cpan dot org>
# Contributor: Kars Wang <jaklsy at gmail dot com>

_perlmod='Test-File-ShareDir'
_modnamespace=Test
pkgname=perl-test-file-sharedir
pkgver=1.001002
pkgrel=1
pkgdesc="Create a Fake ShareDir for your modules for testing."
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-class-tiny' 'perl-file-copy-recursive' 'perl-file-sharedir' 'perl-path-tiny' 'perl-scope-guard' 'perl-test-fatal')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('b33647cbb4b2f2fcfbde4f8bb4383d0ac95c2f89c4c5770eb691f1643a337aad')

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
