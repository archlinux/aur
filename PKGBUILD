# Contributor: Swift Geek <swiftgeek «at» gmail.com>
pkgname=perl-extutils-typemaps-default
pkgver=1.05
pkgrel=1
pkgdesc="ExtUtils::Typemaps::Default - A set of useful typemaps"
arch=('any')
url="http://search.cpan.org/dist/ExtUtils-Typemaps-Default//"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/ExtUtils-Typemaps-Default-${pkgver}.tar.gz")
md5sums=('346c127faf7b74bc4cfc29fa3e8e6f8d')

prepare() {
  export _src_dir="$srcdir/ExtUtils-Typemaps-Default-$pkgver"
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
}

build() {
  cd "$_src_dir"
  /usr/bin/perl Build.PL 
  ./Build 
}

check () {
  cd "$_src_dir"
  ./Build test
}

package () {
  cd "$_src_dir"
  ./Build install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

