# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

_distname='Devel-PartialDump'
pkgname="perl-${_distname@L}"
pkgver='0.20'
pkgrel='2'
pkgdesc="Partial dumping of data structures, optimized for argument printing."
arch=('any')
license=('LicenseRef-GPL-1.0-or-later OR Artistic-1.0-Perl')
options=('!emptydirs')
depends=(
  'perl'
  'perl-class-tiny'
  'perl-namespace-clean'
  'perl-sub-exporter'
)
checkdepends=(
  'perl-sub-name'
  'perl-test-warnings'
  'perl-yaml'
)
url="https://metacpan.org/release/$_distname"
_author='ETHER'
source=("https://search.cpan.org/CPAN/authors/id/${_author::1}/${_author::2}/$_author/$_distname-$pkgver.tar.gz")
sha512sums=('1229fb82c62815eb030ddc3cdf037a877e46a1a00c6b6f6f99a562865649067757fe1e42e8242bdf8107b43197c5e47915da5fb6f502a2c90977022b47579b95')
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

  install -Dm644 LICENCE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
