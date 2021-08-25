# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=perl-text-unaccent-pureperl
pkgver='0.05'
pkgrel='1'
pkgdesc="Perl module for “unaccenting” characters. Pure Perl equivalent to the Text::Unaccent module."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.0' 'perl-io-all')
makedepends=()
url='https://metacpan.org/pod/Text::Unaccent::PurePerl'
source=("https://cpan.metacpan.org/authors/id/P/PJ/PJACKLAM/Text-Unaccent-PurePerl-$pkgver.tar.gz")
sha512sums=('94664b333fa808ea226247a62267d546ae45ce2349abaf7a3e6f6ee2280f27ad950f5e9a42c65281e179966381a2eab166109e9039fc142568a50ac97d4aef74')
_distdir="Text-Unaccent-PurePerl-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}
