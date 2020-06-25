# Contributor: Daniel Müllner <daniel@danifold.net>
pkgname=perl-crypt-random-seed
pkgver=0.03
pkgrel=4
pkgdesc='Simple method to get strong randomness.'
_dist=Crypt-Random-Seed
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-crypt-random-tesha2)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DANAJ/$_dist-$pkgver.tar.gz")
sha256sums=('593da54b522c09cc26bbcc0e4e49c1c8e688a6fd33b0726af801d722a5c8d0f1')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
