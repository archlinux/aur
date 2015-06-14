# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

_author=A/AZ/AZAWAWI
_perlmod=Wx-Scintilla
pkgname=perl-wx-scintilla
pkgver=0.39
pkgrel=1
pkgdesc='Wx::Scintilla - Scintilla source code editing component for wxWidgets'
arch=('i686' 'x86_64')
url="http://search.cpan.org/~azawawi/Wx-Scintilla/"
license=('GPL' 'PerlArtistic')
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
sha256sums=('d6d67528a55552bb3fda2a1f22058c6c94a05eaf632dba5331afb3390defe0ea'
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
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build test
}
package(){
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build install
  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
