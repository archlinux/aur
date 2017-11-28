pkgname=perl-pgtap
pkgver=3.33
pkgrel=1
pkgdesc='Stream TAP from pgTAP test scripts'
_dist=TAP-Parser-SourceHandler-pgTAP
arch=('any')
url="http://pgtap.org"
license=('PerlArtistic')
depends=(perl perl-module-build)
source=("https://cpan.metacpan.org/authors/id/D/DW/DWHEELER/$_dist-$pkgver.tar.gz")
md5sums=("538e590181de80492f5654ebd5b687d7")

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
  ./Build install installdirs=vendor destdir="$pkgdir"
}
