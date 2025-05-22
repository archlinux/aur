# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-graph'
_dist='Graph'
pkgver='0.9735'
pkgrel='2'
pkgdesc='graph data structures and algorithms'
url='https://metacpan.org/release/Graph'
arch=('any')
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
options=('!emptydirs')
depends=(
  'perl'
  'perl-heap'
  'perl-set-object'
)

source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETJ/$_dist-$pkgver.tar.gz")
b2sums=('15ab82894117c17b758cc7ef1dbb1c52e2f430189081fb54b73aecb9ce311ef98749e92d583cb6d030ae62f81541a6e0b2ad029e88011cdcab15a5ca831b27ee')

build() {
  cd "$srcdir/$_dist-$pkgver" || exit

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT

  export PERL_MM_USE_DEFAULT=1 \
    PERL_AUTOINSTALL=--skipdeps \
    MODULEBUILDRC=/dev/null

  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver" || exit

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1

  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver" || exit

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT

  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
