# Maintainer: Markus Schaaf <markuschaaf@gmail.com>
pkgname=perl-convert-zbase32
pkgver=0.0201
pkgrel=1
pkgdesc='Convert::zBase32 - Convert human-oriented base-32 encoded strings'
_dist=Convert-zBase32
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl)
checkdepends=(perl-test-pod perl-test-pod-coverage)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/G/GW/GWYN/$_dist-$pkgver.tar.gz")

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
  make pure_install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  find "$pkgdir/usr/lib" -name .packlist -delete
}

sha256sums=('d080d0060187381d6e6d4c74f862eebc9d36bfa80b94919c25afff75b40d808a')
