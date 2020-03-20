# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: sL1pKn07 <sl1pkn07@gmail.com>

_distname=Test-use-ok
pkgname=perl-test-use-ok
pkgver=0.11
pkgrel=5
pkgdesc="Alternative to Test::More::use_ok"
arch=('any')
url="http://search.mcpan.org/dist/$_distname"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.8.9')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/A/AU/AUDREYT/$_distname-$pkgver.tar.gz")
sha256sums=('8410438a2acf127bffcf1ab92205b747a615b487e80a48e8c3d0bb9fa0dbb2a8')

build() {
  cd "$_distname-$pkgver"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="" PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  perl -I. Makefile.PL
  make
}

check() {
  cd "$_distname-$pkgver"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "$_distname-$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
