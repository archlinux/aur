# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Math-BigInt-Lite
cpanauthor=PJACKLAM
pkgname='perl-math-bigint-lite'
pkgver=0.18
pkgrel=1
pkgdesc="What Math::BigInts are before they become big"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
    perl
    perl-math-bigint
)
url=http://search.cpan.org/dist/${cpaname}
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
md5sums=('05686c1ae7cbc0c9dd5f1a8262c852f2')
sha256sums=('448213bd068843a1179ab1c63d38c5c836b612a61cf226ab89325b23e09427d5')
sha512sums=('f7bf76742a0de6a9065c577eb583d5df71a7264d056bea73ffb5f54364a25d8b191c81bc7a30631589988c38418b520c99ac85aa4e83c5dd43308ac98ff74f64')

build() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null
  perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
