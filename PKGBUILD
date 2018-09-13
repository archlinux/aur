# Maintainer: Jameson Pugh <imntreal@gmail.com.

pkgname='perl-class-std-fast'
pkgver='0.0.8'
pkgrel='1'
pkgdesc="faster but less secure than Class::Std"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-std')
makedepends=('perl-module-build')
url='https://metacpan.org/pod/Class::Std::Fast'
source=("https://cpan.metacpan.org/authors/id/A/AC/ACID/Class-Std-Fast-v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/Class-Std-Fast-v${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/Class-Std-Fast-v${pkgver}"
  make test
}

package() {
  cd "${srcdir}/Class-Std-Fast-v${pkgver}"
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# vim:set ts=2 sw=2 et:
sha256sums=('1bd43763c6a373183097a30e787f5d6713b0db27511c52d533266b59d2cfa780')
