# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Number-Fraction
cpanauthor=DAVECROSS
pkgname='perl-number-fraction'
pkgver=3.0.4
pkgrel=1
pkgdesc="model fractions"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
    perl
    perl-moo
    perl-moose
    perl-moox-types-mooselike
)
checkdepends=(
    perl-test-pod
    perl-test-pod-coverage
    perl-test-warn
)
url=http://search.cpan.org/dist/${cpaname}
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-v${pkgver}.tar.gz")
md5sums=('ec6cdc0ca8b3d8b9fcb8c23a9fbf01f1')
sha256sums=('c6419c8ab778fd729b10d7e6a78f3b7b07fc08957c1f79e5666dcdcb4d62c085')
sha512sums=('c309e4ee95909a8ad570f061387490c49cf11d71b76569dc2b3b98c8c4bc0c2b4936ca6f14dc5818ca3aea34fec06486665269f304ff5141c566acc061522407')

build() {
  cd "${srcdir}/${cpaname}-v${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null
  perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/${cpaname}-v${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "${srcdir}/${cpaname}-v${pkgver}"
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
