# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

_distname='MooseX-Blessed-Reconstruct'
pkgname="perl-${_distname@L}"
pkgver='1.01'
pkgrel='1'
pkgdesc="A Data::Visitor for creating Moose objects from blessed placeholders"
arch=('any')
license=('LicenseRef-GPL-1.0-or-later OR Artistic-1.0-Perl')
options=('!emptydirs')
depends=(
  'perl'
  'perl-data-visitor'
  'perl-module-runtime'
  'perl-moose'
  'perl-namespace-clean'
)
url="https://metacpan.org/release/$_distname"
_author='YANICK'
source=("https://search.cpan.org/CPAN/authors/id/${_author::1}/${_author::2}/$_author/$_distname-$pkgver.tar.gz")
sha512sums=('c81dd1958be1ddd881a4cc112030fa7c69301b17fb3f71313457130f64ea1cb39f7f78a5b7c87dbc889cc62fbd6098d15ecf994162e606dfd88fcb29018be7dc')
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
