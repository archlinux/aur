_author=F/FA/FAYLAND
_perlmod=Padre-Plugin-ViewInBrowser
pkgname=perl-padre-plugin-viewinbrowser
pkgver=0.07
pkgrel=3
pkgdesc='Padre::Plugin::ViewInBrowser - view selected doc in default browser for Padre'
arch=('any')
url='https://metacpan.org/dist/Padre-Plugin-ViewInBrowser'
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl-padre
)
makedepends=(perl)
options=(!emptydirs)
source=(https://cpan.metacpan.org/authors/id/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('e8509f979f94712ecfec702bce2c1e96')
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null

# prepare(){
#   cd "$srcdir/$_perlmod-$pkgver"
#   _padre_version=$(LC_ALL=C pacman -Qi perl-padre 2>/dev/null | grep '^Version' | awk '{print $3}' | cut -d- -f1)
#   if [ -z "$_padre_version" ]; then
#     _padre_version=0.96
#   fi
#   sed -e "s/0.26/$_padre_version/" -i lib/Padre/Plugin/ViewInBrowser.pm
# }
build(){
  cd "$srcdir/$_perlmod-$pkgver"
  perl Makefile.PL
  make
}
check(){
  cd "$srcdir/$_perlmod-$pkgver"
  make test
}
package(){
  cd "$srcdir/$_perlmod-$pkgver"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
