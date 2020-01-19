# Maintainer : Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=perl-git-fastexport
pkgver=0.108
pkgrel=1
pkgdesc='A parser for git fast-export streams'
_dist=Git-FastExport
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-git-repository)
checkdepends=(git perl-test-requires-git)
options=(purge '!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/B/BO/BOOK/$_dist-$pkgver.tar.gz")
md5sums=('4eb973b24f85483efc9a2c19c078a19b')
sha256sums=('4e976b247a6fb837f40a5d4861fd8a157b8e57040cf36ba4496a3491038683ef')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
