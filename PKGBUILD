# Contributor: Swift Geek <swiftgeek «at» gmail.com>
pkgname=perl-math-libm
pkgver=1.00
pkgrel=1
pkgdesc="Math::Libm - Perl extension for the C math library, libm"
arch=('any')
url="https://metacpan.org/release/Math-Libm/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/D/DS/DSLEWART/Math-Libm-${pkgver}.tar.gz")
md5sums=('26a4ce8fe507d04c7d40b9eadac428ae')
_src_dir='$srcdir/Math-Libm-$pkgver'

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

