# Maintainer: Piotr Rogoża <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoża <piotr dot r dot public at gmail dot com>

_author=B/BO/BOWTIE
_perlmod=Padre-Plugin-YAML
pkgname=perl-padre-plugin-yaml
pkgver=0.10
pkgrel=1
pkgdesc='Padre::Plugin::YAML - YAML support for Padre, The Perl IDE'
arch=('any')
url="http://search.cpan.org/~bowtie/Padre-Plugin-YAML/"
license=('GPL' 'PerlArtistic')
depends=(
perl-yaml-libyaml
perl-padre
perl-try-tiny)
makedepends=()
optdepends=()
provides=(
perl-padre-plugin-yaml-document
perl-padre-plugin-yaml-syntax 
)
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
sha256sums=('b18b7fb21d3080010af83718ad32aebe4b839c96c5b2cf844e60dd2b7432f78d')
