# Contributor: Mark Gallagher <mark@fts.scot>
pkgname=perl-pandoc
pkgver=0.9.2
pkgrel=1
pkgdesc='wrapper for the mighty Pandoc document converter (via MetaCPAN distribution)'
_dist=Pandoc
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-file-which' 'perl-http-tiny' 'perl-ipc-run3' 'perl-json-pp')
makedepends=('perl-test-exception')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/V/VO/VOJ/$_dist-$pkgver.tar.gz")
sha256sums=(f66eca94374a2e124d522cb75c5d9267244a7514bcdfe989a2626896648b5962)

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}
