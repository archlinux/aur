# Contributor: Swift Geek <swiftgeek «at» gmail.com>
pkgname=perl-math-geometry-voronoi
pkgver=1.3
pkgrel=1
pkgdesc="Math::Geometry::Voronoi - compute Voronoi diagrams from sets of points"
arch=('any')
url="https://metacpan.org/release/Math-Geometry-Voronoi/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-params-validate' 'perl-class-accessor' 'perl-try-tiny')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/S/SA/SAMTREGAR/Math-Geometry-Voronoi-${pkgver}.tar.gz")
md5sums=('44392be55ff56870aaff286dd735a5e2')

prepare() {
  export _src_dir="$srcdir/Math-Geometry-Voronoi-$pkgver"
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
