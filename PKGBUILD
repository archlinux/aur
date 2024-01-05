# Maintainer: Jan Krüger <jk@jk.gs>

pkgname=perl-xml-easy
pkgver=0.011
pkgrel=1
pkgdesc="XML processing with a clean interface"
_dist=XML-Easy
url="http://search.cpan.org/dist/$_dist/"
license=("PerlArtistic")
arch=('i686' 'x86_64')
depends=('perl' 'perl-params-classify')
makedepends=('perl-module-build')
options=('!emptydirs' purge)
source=(https://cpan.metacpan.org/authors/id/Z/ZE/ZEFRAM/$_dist-$pkgver.tar.gz)
md5sums=('b2f7a938ed51c4550fc84f30264412c5')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}
check () {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}
package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install installdirs=vendor destdir="$pkgdir"
}
