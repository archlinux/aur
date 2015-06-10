pkgname='perl-extutils-parsexs-aur'
pkgver='3.24'
pkgrel='1'
pkgdesc="Converts Perl XS code into C code"
arch=('any')
url='https://metacpan.org/release/ExtUtils-ParseXS'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
provides=(perl-extutils-parsexs=${pkgver})

source=("http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/ExtUtils-ParseXS-$pkgver.tar.gz")
md5sums=('e6be3f1d493e04ed805576104cf4328b')

prepare() {
  export _src_dir="$srcdir/ExtUtils-ParseXS-$pkgver"
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
}

build() {
  cd "$_src_dir"
  /usr/bin/perl Makefile.PL
  make
}

check () {
  cd "$_src_dir"
  make test
}

package () {
  cd "$_src_dir"
  make install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
