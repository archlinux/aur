# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
pkgname=perl-file-cat
pkgver=1.2
pkgrel=1
pkgdesc="Perl implementation of cat(1)"
arch=('any')
url='https://metacpan.org/pod/File::Cat'
license=('PerlArtistic')
depends=('perl>=0')
makedepends=()
options=('!emptydirs')
source=('http://search.cpan.org/CPAN/authors/id/F/FI/FIMM/File-Cat-1.2.tar.gz')
md5sums=('300600b3786cec4360e88947f775f4fb')
_distdir="File-Cat-$pkgver"

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

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
