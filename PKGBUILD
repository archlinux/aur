# Contributor: Christos Nouskas <nous@archlinux.us>

pkgname='perl-types-path-tiny'
pkgver='0.006'
pkgrel='1'
pkgdesc="Path::Tiny types and coercions for Moose and Moo"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-pushd' 'perl-path-tiny' 'perl-type-tiny')
url='https://metacpan.org/release/Types-Path-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Types-Path-Tiny-0.006.tar.gz')
md5sums=('071c6b98edebfc2fac8603e7cd13650a')
_distdir="Types-Path-Tiny-0.006"

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
