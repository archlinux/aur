# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

_author=A/AZ/AZAWAWI
_perlmod=Wx-Scintilla
pkgname=perl-wx-scintilla-dev
pkgver=0.40_02
pkgrel=1
pkgdesc='Wx::Scintilla - Scintilla source code editing component for wxWidgets - Developer Release'
arch=('i686' 'x86_64')
url='http://search.cpan.org/~azawawi/Wx-Scintilla/'
license=('GPL' 'PerlArtistic')
conflicts=(perl-wx-scintilla)
depends=(
perl
wxgtk2.8
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
p.patch
)
sha256sums=('4772ef1502ce332a8a91f1a53518616498b9a8f5d16a296052cc86fa622f270e'
            '53d8f6018affd735b4deb5d80128c9a0106185ddab5ed53f1409975319188e52'
            'f75b4ba5bb44e74a49df386ae4a6a9aa27f25eacdc8bbc7ff0a59f34984ad7d0')
prepare(){
  cd "$srcdir/$_perlmod-$pkgver"
  patch -Np1 -i "$srcdir/remove-uneeded-libs.patch"
  patch -Np1 -i "$srcdir/p.patch"
}
build(){
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}
check(){
  return 0
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build test
}
package(){
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build install
  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
