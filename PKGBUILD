# Maintainer: René Wagner
# Contributor: Christian Sturm <reezer@reezer.org>
pkgname=perl-modern-perl
pkgver=1.20240115
pkgrel=1
pkgdesc="enable all of the features of Modern Perl with one command"
arch=(any)
url="https://metacpan.org/release/Modern-Perl"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=('make')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/C/CH/CHROMATIC/Modern-Perl-$pkgver.tar.gz")
sha256sums=('7027280375794633189f86e66b6fc9f96b0aaffeb225f14747fbb26e588bf36e')

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
