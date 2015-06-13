pkgname='perl-hash-merge'
pkgver='0.200'
pkgrel="2"
pkgdesc="Merges arbitrarily deep hashes into a single hash"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-clone')
url='http://search.cpan.org/dist/Hash-Merge'
source=("http://search.cpan.org/CPAN/authors/id/R/RE/REHSACK/Hash-Merge-${pkgver}.tar.gz")
md5sums=('54b5743103fb3b3986a384b5424f21f4')
sha512sums=('b04f5229f70630d5a1552dcff83743d4c053bfd8b7b294fb03b21f2e7c12b6540a39e6c93fe016960686e1e9107dc0507d15406247da827fb608bc273e53eeec')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Hash-Merge-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
