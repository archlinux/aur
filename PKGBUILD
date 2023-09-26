pkgname='perl-extutils-parsexs'
pkgver='3.51'
pkgrel='1'
pkgdesc="Converts Perl XS code into C code"
arch=('any')
url='https://metacpan.org/release/ExtUtils-ParseXS'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-ParseXS-$pkgver.tar.gz")
sha256sums=('82431a57425d78682acefb3a2cc9287683d091c8d034b825c584d9805bed6535')
#_src_dir='$srcdir/ExtUtils-ParseXS-$pkgver'
_src_dir='$srcdir/ExtUtils-ParseXS-$pkgver'

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
