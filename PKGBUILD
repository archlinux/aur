# Contributor: Swift Geek <swiftgeek «at» gmail.com>
pkgname=perl-math-clipper
pkgver=1.29
pkgrel=1
pkgdesc="Math::Clipper - Polygon clipping in 2D"
arch=('any')
url="https://metacpan.org/release/Math-Clipper/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-extutils-typemaps-default' 'perl-test-deep' 'perl-module-build-withxspp' 'perl-extutils-xspp')
makedepends=('perl-module-build')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/S/SH/SHELDRAKE/Math-Clipper-${pkgver}.tar.gz")
md5sums=('7bb81a72ce4cdd0397e05de18905a94b')
_src_dir='$srcdir/Math-Clipper-$pkgver'

build() {
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  eval cd "$_src_dir"
  /usr/bin/perl Build.PL
  ./Build
}

check () {
  eval cd "$_src_dir"
  ./Build test
}

package () {
  eval cd "$_src_dir"
  ./Build install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
