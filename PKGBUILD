# Contributor: Swift Geek <swiftgeek «at» gmail.com>
pkgname=perl-math-convexhull
pkgver=1.04
pkgrel=1
pkgdesc="Math::ConvexHull - Calculate convex hulls using Graham's scan (n*log(n))"
arch=('any')
url='https://metacpan.org/release/Math-ConvexHull/'
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Math-ConvexHull-${pkgver}.tar.gz")
md5sums=('5d9225c5fadf5c71172cd88c81661d4d')

prepare() {
  export _src_dir="$srcdir/Math-ConvexHull-$pkgver"
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
}

build() {
  cd "$_src_dir"
  /usr/bin/perl Makefile.PL
  make
}

check () {
  cd "$_src_dir"
  make test
}

package () {
  cd "$_src_dir"
  make install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
