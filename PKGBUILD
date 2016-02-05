# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Drathir <drathir87@gmail.com>

pkgname='perl-cryptx'
_cpanname='CryptX'
pkgver='0.027'
pkgrel='1'
pkgdesc="Crypto toolkit (self-contained no external libraries needed)"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json>=2.01' 'perl>=5.06')
makedepends=('perl-module-build')
url='https://metacpan.org/release/CryptX'
source=("https://cpan.metacpan.org/authors/id/M/MI/MIK/${_cpanname}-${pkgver}.tar.gz")
md5sums=('664f8e7445e13baaf406d8807600764a')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/${_cpanname}-${pkgver}"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/${_cpanname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/${_cpanname}-${pkgver}"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
