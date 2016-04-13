# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Drathir <drathir87@gmail.com>

pkgname='perl-cryptx'
_cpanname='CryptX'
pkgver='0.030'
pkgrel='1'
pkgdesc="Crypto toolkit (self-contained no external libraries needed)"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json>=2.01' 'perl>=5.06')
url='https://metacpan.org/release/CryptX'
source=("https://cpan.metacpan.org/authors/id/M/MI/MIK/${_cpanname}-${pkgver}.tar.gz")
md5sums=('6ce9cc5289eaa8093da3ad62b9298d2a')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/${_cpanname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/${_cpanname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/${_cpanname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
