# Contributor: Your Name <youremail@domain.com>
# Author: Matteo Cantoni, <matteo.cantoni@nothink.org>
pkgname=perl-www-useragent-random
pkgver=0.03
pkgrel=1
pkgdesc='WWW::UserAgent::Random - Perl extension to generate random User Agent'
_dist=WWW-UserAgent-Random
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl)
options=('!emptydirs' purge)
source=("https://www.cpan.org/modules/by-module/WWW/MCANTONI/$_dist-$pkgver.tar.gz")
sha256sums=('f139adef8863ecd8091db5ebb20842a896c5e6c9911741b81d6adc7f999b6f99')

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