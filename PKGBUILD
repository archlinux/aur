# Contributor: Ben Webb <bjwebb67 at googlemail dot com>
pkgname=perl-universal-moniker
pkgver=0.08
pkgrel=1
pkgdesc="Add monikers to all classes."
arch=(any)
url="http://search.cpan.org/dist/UNIVERSAL-moniker/moniker.pm"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/K/KA/KASEI/UNIVERSAL-moniker-$pkgver.tar.gz)
md5sums=('e59b97ccf88f9fa68c3e5c18d7059d57')

build() {
  cd "$srcdir/UNIVERSAL-moniker-$pkgver"

  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
