# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

_distname='Data-DPath'
pkgname="perl-${_distname@L}"
pkgver='0.59'
pkgrel='1'
pkgdesc="A library that provides data structures inspired by XPath"
arch=('any')
license=('LicenseRef-GPL-1.0-or-later OR Artistic-1.0-Perl')
options=('!emptydirs')
depends=(
  'perl'
  'perl-aliased'
  'perl-class-xsaccessor'
  'perl-iterator-util'
  'perl-sub-exporter'
)
checkdepends=('perl-test-deep')
url="https://metacpan.org/release/$_distname"
_author='SCHWIGON'
source=("https://search.cpan.org/CPAN/authors/id/${_author::1}/${_author::2}/$_author/$_distname-$pkgver.tar.gz")
sha512sums=('1020402bf810ef2c0f84ca002819b5235090df1ea83f70f4c846afa4e485868cd8d6583268cfeaf4c77a6ea37fdee803c98aa77d74c4df70b543c35e87ad1e0b')
_distdir="$_distname-$pkgver"

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

  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
