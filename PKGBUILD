# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

_author=A/AZ/AZAWAWI
_perlmod=Wx-Scintilla
pkgname=perl-wx-scintilla-dev
pkgver=0.40_02
pkgrel=4
pkgdesc='Wx::Scintilla - Scintilla source code editing component for wxWidgets - Developer Release'
arch=('i686' 'x86_64')
url='http://search.cpan.org/~azawawi/Wx-Scintilla/'
license=('GPL' 'PerlArtistic')
conflicts=(perl-wx-scintilla)
depends=(
perl
# wxgtk2.8
wxgtk
)
makedepends=(
perl-alien-wxwidgets
perl-extutils-xspp
perl-test-simple
perl-wx
perl-module-build
)
provides=(
'perl-wx-scintilla=0.40_02'
perl-wx-scintilla-constant
perl-wx-scintilla-textctrl
perl-wx-scintilla-textevent
perl-wx-scintillatextctrl
perl-wx-scintillatextevent
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz"
remove-uneeded-libs.patch
# wx-config-2.8.patch
https://anonscm.debian.org/cgit/pkg-perl/packages/libwx-scintilla-perl.git/plain/debian/patches/Fix_STC_compilation_with_GCC6.patch
)
sha256sums=('4772ef1502ce332a8a91f1a53518616498b9a8f5d16a296052cc86fa622f270e'
            '53d8f6018affd735b4deb5d80128c9a0106185ddab5ed53f1409975319188e52'
            'f6e31893d71e1fc7ba10f7ad33bf478be952442ecf718e615ec28532e9527401')
prepare(){
  cd "$srcdir/$_perlmod-$pkgver"
  patch -Np1 -i "$srcdir/remove-uneeded-libs.patch"
  patch -Np1 -i "$srcdir/Fix_STC_compilation_with_GCC6.patch"
#   patch -Np1 -i "$srcdir/wx-config-2.8.patch"
}
build(){
  cd "$srcdir/$_perlmod-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  perl Build.PL
  ./Build
}
check(){
#   return 0
  cd "$srcdir/$_perlmod-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}
package(){
  cd "$srcdir/$_perlmod-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install installdirs=vendor destdir="$pkgdir"
}
