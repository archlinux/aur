pkgname=perl-pgtap-git
pkgver=v3.36.r6.g06cccbe
pkgrel=1
pkgdesc='Stream TAP from pgTAP test scripts'
_dist=tap-parser-sourcehandler-pgtap
arch=('any')
url="http://pgtap.org"
license=('PerlArtistic')
depends=(perl perl-module-build)
source=("git+https://github.com/theory/tap-parser-sourcehandler-pgtap.git")
md5sums=("SKIP")


pkgver() {
  cd "$srcdir/$_dist"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_dist"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd "$srcdir/$_dist"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "$srcdir/$_dist"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install installdirs=vendor destdir="$pkgdir"
}
