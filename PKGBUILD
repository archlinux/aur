# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Math-BigInt-Lite
cpanauthor=PJACKLAM
pkgname='perl-math-bigint-lite'
pkgver=0.27
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
md5sums=('bfbbdcbdfa4a1bf27bd7cc8f469b6222')
sha256sums=('f264a54b8d0380e7d3fb35854e90f634b5278e75e259fb303a6321ad42a66925')
sha512sums=('c6d99a394ae9d4ac3b9a420d0e702f4da02d879a115875fee4d5ef61e22ebf1e8b5454b0674efa3c85690ff412c1a9edda52cabd6f994457100c16981911e368')

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
