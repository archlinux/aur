# Contributor: Daniel Kamil Kozar <dkk089@gmail.com>
pkgname=perl-taglib
pkgver=1.65
pkgrel=1
pkgdesc='Perl bindings for the TagLib Audio Meta-Data Library'
_dist=Audio-TagLib
arch=('i686' 'x86_64')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=(perl taglib)
checkdepends=(perl-test-deep)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/G/GL/GLEACH/$_dist-$pkgver.tar.gz")
sha1sums=(ec6c561a4f9dec9d2669a784d59454727875eef2)

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
