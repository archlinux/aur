# Maintainer: Flammkuchen <aur at bbirkner dot de>
_pkgname=Object-Pad
pkgname=perl-object-pad
pkgver=0.813
pkgrel=1
pkgdesc="a simple syntax for lexical field-based objects"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-file-sharedir' 'perl-xs-parse-keyword' 'perl-xs-parse-sublike')
makedepends=('perl-module-build')
url='https://metacpan.org/pod/Object::Pad'
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('3a40263a5b12cf73675dd1d5981a1e9fdc8048baaefd0ee47c100dfe55e91a3a9ff6d26937b59567a9e72d3bb8d7e02507bb474cf5d9b8afe7f9bce1cef7b12b')
_distdir="${_pkgname}-${pkgver}"

build() {
  cd ${_distdir}
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd ${_distdir}
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd ${_distdir}
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}
