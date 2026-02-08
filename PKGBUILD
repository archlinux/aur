# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Math-BigInt-Lite
cpanauthor=PJACKLAM
pkgname='perl-math-bigint-lite'
pkgver=0.30
pkgrel=1
pkgdesc="What Math::BigInts are before they become big"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
    'perl'
    'perl-math-bigint>=1.999840'
)
url=http://search.cpan.org/dist/${cpaname}
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
b2sums=('a715b33cef378b998c5378aea6729363995e9ee942b77c858731a562d0dd9c6885130da9bf2daff0bc2fe29f166b5e51b470fe6ff8a327685704dc5389302678')

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
