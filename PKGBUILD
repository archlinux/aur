# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-file-slurper'
pkgver='0.009'
pkgrel='1'
pkgdesc="A simple, sane and efficient module to slurp a file"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=()
checkdepends=('perl-test-warnings>=0')
url='https://metacpan.org/release/File-Slurper'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/File-Slurper-0.009.tar.gz')
md5sums=('b4ffcb66095aebbcd6df03de7befda13')
sha512sums=('e07074eb5470df75c43848d9bd2e0c5d3bfabf3b6f9739e67d830ce87f4f38a3a569aeca885537d0f9c7d2e285e52f7dfdc27f8035ce0d74d6c750067959f057')
_distdir="File-Slurper-0.009"

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
