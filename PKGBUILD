# Maintainer: Flammkuchen <aur at bbirkner dot de>
_pkgname=Object-Pad
pkgname=perl-object-pad
pkgver=0.821
pkgrel=1
pkgdesc="a simple syntax for lexical field-based objects"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-file-sharedir' 'perl-xs-parse-keyword' 'perl-xs-parse-sublike')
makedepends=('perl-module-build')
url='https://metacpan.org/pod/Object::Pad'
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('521dc7afcc6fa31dd1c79a52f7a83182e12c9ab7fe0e39e5d7467f910ea016d6f5d646542cd992b09cb44ffe6c25ada6eee35f5bd878941401883003f89bb897')
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
