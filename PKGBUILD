# Maintainer: Flammkuchen <aur at bbirkner dot de>
_pkgname=Object-Pad
pkgname=perl-object-pad
pkgver=0.822
pkgrel=1
pkgdesc="a simple syntax for lexical field-based objects"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-file-sharedir' 'perl-xs-parse-keyword' 'perl-xs-parse-sublike')
makedepends=('perl-module-build')
url='https://metacpan.org/pod/Object::Pad'
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('204fec2b85015653551760405240f6755aa3eafdcf473376a757f5545e8091a014319b77e9521ed7090350bdd91cd1510e4a0a5a86d8fe24922de4ed09be017d')
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
