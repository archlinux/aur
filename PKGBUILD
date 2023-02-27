# Maintainer: camb

pkgname=perl-cli-osprey
pkgver=0.08
pkgrel=1
pkgdesc='Module to assist in writing commandline applications with M* OO modules.'
_dist='CLI-Osprey'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
# Author doesn't say minimum perl version but currently Getopt::Long::Descriptive needs 5.12
depends=('perl>=5.12' 'perl-getopt-long-descriptive' 'perl-module-runtime' 'perl-moo' 'perl-path-tiny')
checkdepends=('perl>=5.12' 'perl-test-lib>=0')
makedepends=('perl-module-build-tiny')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/A/AR/ARODLAND/$_dist-$pkgver.tar.gz")
md5sums=('faacf1400414bc57e551c4ce700523b1')
sha256sums=('f7480523dbdf2c2b53789c06a8bd91cf6579bb8cc5678e72ea8a1faaab30d19a')
sha512sums=('f643cc4981d3140da3bc713e9a12c36fd5b7bcaff493e9f462de59f8dcee18a66fa7be3154fd9dbcf4a5bc63cdf8d3a3896e2efc96dcb4862c7319e38a5de240')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}
