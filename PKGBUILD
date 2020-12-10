# Maintainer: Ash Berlin-Taylor <ash_archlinux@firemirror.com>
pkgname='perl-yaml-pp'
pkgver='0.026'
pkgrel='1'
pkgdesc="Simple configuration automation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=('perl-test-deep>=0' 'perl-test-warn>=0')
url='http://search.cpan.org/dist/YAML-PP'
source=('http://search.cpan.org/CPAN/authors/id/T/TI/TINITA/YAML-PP-0.026.tar.gz')
sha512sums=('df13083fd641ddbcbdc9fe69875d459d3fd7f6295b8fd281b1a216794397f9966df552515dda05c4b001a426b91536ffa04bc519babccf4b4b9d5c929eb3d7fa')
_distdir="YAML-PP-0.026"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
