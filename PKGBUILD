# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Math-NumSeq
cpanauthor=KRYDE
pkgname='perl-math-numseq'
pkgver=72
pkgrel=1
pkgdesc="number sequences"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-homedir>=0' 'perl-math-factor-xs>=0.40' 'perl-math-libm>=0' 'perl-math-prime-xs>=0.23' 'perl-module-pluggable>=0' 'perl-module-util>=0' 'perl-constant-defer>=1' 'perl>=5.004')
makedepends=()
url=http://search.cpan.org/dist/${cpaname}
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
md5sums=('2bb1b103470548d4fad0528e6aad475e')
sha256sums=('75aeba105d7edc7fb32d832d8948b5535de8078442876ca0b01f3e3648e9c6f5')
sha512sums=('7ba1c69eced5adeca7cc0d6247885b291d7b96b09d256e652c207ebd034b8ceea477d4016a71f28f4247b8f5ba644dcaacbd9b358144ee06057c30b0bc1f0cbc')

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
