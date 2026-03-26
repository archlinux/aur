# Maintainer: Flammkuchen <aur at bbirkner dot de>
_pkgname=Object-Pad
pkgname=perl-object-pad
pkgver=0.825
pkgrel=1
pkgdesc="a simple syntax for lexical field-based objects"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-file-sharedir' 'perl-xs-parse-keyword' 'perl-xs-parse-sublike')
makedepends=('perl-module-build')
url='https://metacpan.org/pod/Object::Pad'
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('515a6c003ff582a14f23818e402d3c1f0ff598cf7cd38dd55771a4e010b7a520fd0b811ec4befc5de374fe316b4c39e56d3ec3fe8b619cc8b772e707a7dff7f6')
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
