# Contributor: Swift Geek <swiftgeek «at» gmail.com>
pkgname=perl-math-planepath
pkgver=129
pkgrel=1
pkgdesc="Math::PlanePath -- points on a path through the 2-D plane"
arch=('any')
url="https://metacpan.org/release/Math-PlanePath/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-constant-defer' 'perl-math-libm')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/K/KR/KRYDE/Math-PlanePath-${pkgver}.tar.gz")
md5sums=('3e716fee3374a887983dffdf19bba230')
_src_dir='$srcdir/Math-PlanePath-$pkgver'

build() {
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  eval cd "$_src_dir"
  /usr/bin/perl Makefile.PL
  make
}

check () {
  eval cd "$_src_dir"
  make test
}

package () {
  eval cd "$_src_dir"
  pwd
  make install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
