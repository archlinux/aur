# Maintainer: Flammkuchen <aur at bbirkner dot de>
_pkgname=Object-Pad
pkgname=perl-object-pad
pkgver=0.820
pkgrel=1
pkgdesc="a simple syntax for lexical field-based objects"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-file-sharedir' 'perl-xs-parse-keyword' 'perl-xs-parse-sublike')
makedepends=('perl-module-build')
url='https://metacpan.org/pod/Object::Pad'
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('bd5819577591a008b4866b3cc0d4e86342d44112e8b8012cf65008c3f0f17897d7ccc31baa1855f7ae162f98330b45ef520f6e610a33d8cb76e86318ca1ca3b0')
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
