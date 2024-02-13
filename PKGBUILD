# Contributor: Thor77 <thor77 at thor77 dot org>

pkgname=perl-ogg-vorbis-header-pureperl
pkgver=1.0
pkgrel=2
pkgdesc='Perl/CPAN module Ogg::Vorbis::Header::PurePerl - An object-oriented interface to Ogg Vorbis info and comments'
_dist=Ogg-Vorbis-Header-PurePerl
arch=(any)
url="https://metacpan.org/release/$_dist"
license=(GPL-2.0-or-later)
depends=(perl)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/D/DA/DANIEL/$_dist-$pkgver.tar.gz")
sha256sums=('be5e44a980a7ce2191bd5c92858ae2e5bd2bae6fefc1fdd971fe5cc82dd7584e')

prepare() {
  cd "$srcdir/$_dist-$pkgver"
  # unbreak tests
  sed -i -e '/artist/c\is(($ogg->comment("artist"))[0], "maloi");' \
    -e '/album/c\is(($ogg->comment("album"))[0], "this=that");' test.pl
}

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

