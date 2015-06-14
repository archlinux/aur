# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=perl-padre-plugin-cookbook
_author=B/BO/BOWTIE
_perlmod=Padre-Plugin-Cookbook
pkgver=0.24
pkgrel=1
pkgdesc="Padre::Plugin::Cookbook - Cookbook contains recipes to assist you in makeing your own Padre::Plugin"
arch=('any')
url="http://search.cpan.org/dist/Padre-Plugin-Cookbook/"
license=('GPL' 'PerlArtistic')
groups=(perl-padre-plugins)
source=("http://search.cpan.org/CPAN/authors/id/${_author}/${_perlmod}-$pkgver.tar.gz")
depends=(
'perl-data-printer>=0.3'
'perl-moose'
'perl-namespace-autoclean>=0.13'
'perl-padre>=0.96'
)
makedepends=()
provides=(
perl-padre-plugin-cookbook-recipe01-fbp-mainfb
perl-padre-plugin-cookbook-recipe01-main
perl-padre-plugin-cookbook-recipe02-fbp-mainfb
perl-padre-plugin-cookbook-recipe02-main
perl-padre-plugin-cookbook-recipe03-about
perl-padre-plugin-cookbook-recipe03-fbp-aboutfb
perl-padre-plugin-cookbook-recipe03-fbp-mainfb
perl-padre-plugin-cookbook-recipe03-main
perl-padre-plugin-cookbook-recipe04-about
perl-padre-plugin-cookbook-recipe04-fbp-aboutfb
perl-padre-plugin-cookbook-recipe04-fbp-mainfb
perl-padre-plugin-cookbook-recipe04-main
)
options=(!emptydirs)

build() {
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

md5sums=('78845ba61f315a6e7ff3bae77f51a0f7')
