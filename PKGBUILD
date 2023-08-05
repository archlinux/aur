# Maintainer : René Wagner <rwagner at rw-net dot de>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-net-curl'
pkgver='0.54'
pkgrel='1'
pkgdesc="Perl interface for libcurl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('curl>=7.37.0' 'perl')
makedepends=('gcc')
url='http://search.mcpan.org/dist/Net-Curl'
source=("http://search.mcpan.org/CPAN/authors/id/S/SY/SYP/Net-Curl-${pkgver}.tar.gz" "0001-fix-test-13-when-running-curl-8.2.patch")
sha256sums=('ad76bd1bf97d61bbd758a196e945c232d1cb7b2064e751f6c88c344086d6ffbc'
            '1d9f9af639c973f565a2f31d0ba98103a9756b588421da3961921570e57076c9')
_distdir="Net-Curl-${pkgver}"

prepare() {
    cd "$srcdir/$_distdir"
    patch --strip=1 --input="$srcdir/0001-fix-test-13-when-running-curl-8.2.patch"
}

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
