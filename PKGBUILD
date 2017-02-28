# Contributor: Swift Geek <swiftgeek «at» gmail.com>
pkgname=perl-boost-geometry-utils
pkgver=0.15
pkgrel=1
pkgdesc="Boost::Geometry::Utils - Bindings for the Boost Geometry library"
arch=('any')
url="https://metacpan.org/release/Boost-Geometry-Utils/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-module-build-withxspp' 'perl-extutils-typemaps-default' 'perl-extutils-xspp')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/A/AA/AAR/Boost-Geometry-Utils-${pkgver}.tar.gz")
md5sums=('14d705f8efda8db81e118aa8c8a21bed')
_src_dir='$srcdir/Boost-Geometry-Utils-$pkgver'

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
