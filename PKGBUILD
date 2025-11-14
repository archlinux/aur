# Maintainer: John Regan <john@jrjrtech.com>
pkgname=perl-www-mechanize-chrome
pkgver=0.75
pkgrel=1
pkgdesc='WWW::Mechanize::Chrome - automate the Chrome browser'
_dist=WWW-Mechanize-Chrome
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-algorithm-loops'
         'perl-future' 'perl-future-http' 'perl-html-selector-xpath'
         'perl-io-async' 'perl-imager'
         'perl-json' 'perl-log-log4perl'
         'perl-moo' 'perl-moox-role-eventemitter'
         'perl-net-async-websocket' 'perl-object-import'
         'perl-perlx-maybe' 'perl-try-tiny' 'perl-uri'
         'perl-www-mechanize'
)
makedepends=('perl-data-dump' 'perl-filter-signatures' 'perl-image-info' 'perl-test-deep'
             'perl-test-http-localserver' 'perl-test-memory-cycle'
             'perl-test-without-module')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/C/CO/CORION/${_dist}-${pkgver}.tar.gz")
md5sums=('f513ca2fa3226172f7ccdf6c5c830bd7')

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

