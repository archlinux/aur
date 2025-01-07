# Maintainer: René Wagner
# Contributor: Christian Sturm <reezer@reezer.org>
pkgname=perl-modern-perl
pkgver=1.20241001
pkgrel=1
pkgdesc="enable all of the features of Modern Perl with one command"
arch=(any)
url="https://metacpan.org/release/Modern-Perl"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=('make')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/C/CH/CHROMATIC/Modern-Perl-$pkgver.tar.gz")
sha256sums=('dba7bee92ecbf2b0a6cf61e3409ab59b0cd25518bbb90fe387230283aa683dc5')

build() {
  cd "$srcdir/Modern-Perl-$pkgver"

  # for packages with Build.PL, do this instead:
  perl Makefile.PL installdirs=vendor destdir="$pkgdir/"
  make
}

package() {
  cd "$srcdir/Modern-Perl-$pkgver"
  
  make install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
# vim:set ts=2 sw=2 et:
