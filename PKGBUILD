# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Math-BigInt-Lite
cpanauthor=PJACKLAM
pkgname='perl-math-bigint-lite'
pkgver=0.19
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
md5sums=('495b9c476965cc9ce629e2a10dfb89bc')
sha256sums=('30f6034bf5d25c02813c84a8e5a2a98af86e2dbca8149c25a9277718df26151a')
sha512sums=('a0babaa718678c278a3c0a9a74d687563355460aa1c76d8b67adff68232e3dfb96ed56feb72b599a99e65adc228bf0296481773d20489390cc40564da01301d4')

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
