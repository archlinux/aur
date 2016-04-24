# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-xml-hash-lx'
pkgver='0.0603'
pkgrel='1'
pkgdesc="Convert hash to xml and xml to hash using LibXML"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-libxml' 'perl>=5.6.2')
makedepends=('perl-lib-abs>=0.90')
url='https://metacpan.org/release/XML-Hash-LX'
source=('http://search.cpan.org/CPAN/authors/id/M/MO/MONS/XML-Hash-LX-0.0603.tar.gz' 'XML-Hash-LX-0.0603-Fix-unpredictable-order-at-empty-attr-test.patch')
md5sums=('43103ac528427f1cf7212ad5412ade2d' 'abed43872f86f69892ca6754962106e0')

_distdir="XML-Hash-LX-0.0603"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    patch -Np1 -i ../XML-Hash-LX-0.0603-Fix-unpredictable-order-at-empty-attr-test.patch
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
