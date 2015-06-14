# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=A/AZ/AZAWAWI
_perlmod=Padre-Plugin-PerlTidy
pkgname=perl-padre-plugin-perltidy
pkgver=0.22
pkgrel=2
pkgdesc='Padre::Plugin::PerlTidy - Format perl files using Perl::Tidy'
arch=('any')
url="http://search.cpan.org/~azawawi/Padre-Plugin-PerlTidy"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl-tidy
perl-padre)
makedepends=(perl)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
noextract=()

build(){
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
check(){
  cd "$srcdir/$_perlmod-$pkgver"
  make test
}
package(){
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
md5sums=('6abf5f869a860dcd06b2b56a007574fe')
