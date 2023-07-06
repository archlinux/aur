# Contributor: Daniel Kamil Kozar <dkk089@gmail.com>
pkgname=perl-taglib
pkgver=1.67
pkgrel=1
pkgdesc='Perl bindings for the TagLib Audio Meta-Data Library'
_dist=Audio-TagLib
arch=('x86_64')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=(perl taglib)
checkdepends=(perl-test-deep perl-path-class)
options=('!emptydirs' purge)
source=(
  "http://search.cpan.org/CPAN/authors/id/G/GL/GLEACH/$_dist-$pkgver.tar.gz"
  fix-format-security.patch
)
sha1sums=(
  '77f82a894820ded8e7cd21051681860ebfe5c0f3'
  '410ac3f97cd19663db6223b59f8c86edd2000cb8'
)

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  patch -p1 -i "$srcdir/fix-format-security.patch"
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
