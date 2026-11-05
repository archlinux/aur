# Maintainer: Elias Elwyn <a@jthvai.net>

pkgname=perl-test-diaginc
_dist=Test-DiagINC
pkgver=0.010
pkgrel=1
pkgdesc='List modules and versions loaded if tests fail'
license=('Apache-2.0')

url="https://metacpan.org/dist/$_dist"
_author=DAGOLDEN
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('5bcb8d356c509e359d53d869c07efdaa8fee5d6cf99897018b9a914ceb21222e')

arch=(any)
depends=(perl)
checkdepends=(perl-capture-tiny)
options=('!emptydirs')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
