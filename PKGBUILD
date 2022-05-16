# Maintainer: René Wagner
# Contributor: Christian Sturm <reezer@reezer.org>
pkgname=perl-modern-perl
pkgver=1.20220515
pkgrel=1
pkgdesc="enable all of the features of Modern Perl with one command"
arch=(any)
url="https://metacpan.org/release/Modern-Perl"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=('make')
options=(!emptydirs)
source=("http://cpan.metacpan.org/authors/id/C/CH/CHROMATIC/Modern-Perl-$pkgver.tar.gz")
sha256sums=('700c292bd61d6c0c9f1f351d029a15a7144e405294321804f022885e5c59e68f')

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
