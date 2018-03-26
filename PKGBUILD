# Contributor: Swift Geek <swiftgeek «at» gmail.com>
pkgname=perl-extutils-makemaker-aur
pkgver=7.34
pkgrel=1
pkgdesc="ExtUtils::MakeMaker - Create a module Makefile"
arch=('any')
url="https://metacpan.org/release/ExtUtils-MakeMaker/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=()
provides=(perl-extutils-makemaker=${pkgver})
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://www.cpan.org/authors/id/B/BI/BINGOS/ExtUtils-MakeMaker-${pkgver}.tar.gz")
md5sums=('073c0fb4eebf3953de2a1e94fa189bac')
_src_dir='$srcdir/ExtUtils-MakeMaker-$pkgver'

build() {
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  eval cd "$_src_dir"
  /usr/bin/perl Makefile.PL
  make
}

check () {
  eval cd "$_src_dir"
  make test
}

package () {
  eval cd "$_src_dir"
  make install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

