# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Math-NumSeq
cpanauthor=KRYDE
pkgname='perl-math-numseq'
pkgver=75
pkgrel=1
pkgdesc="number sequences"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
  perl
  perl-constant-defer
  perl-file-homedir
  perl-math-factor-xs
  perl-math-libm
  perl-math-prime-xs
  perl-module-pluggable
  perl-module-util
)
url=http://search.cpan.org/dist/${cpaname}
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
md5sums=('42f2df63ccf3f3cfa7ff2297682b4f75')
sha256sums=('7ea3e5cf4122c4cb87bedc371f67443ee3fce7d563e0bff0a65b4dffd61e8c61')
sha512sums=('4992e3a1f6507581bdd8a0623bc5891dde55a1e39262059805e7158b74b0ec5f5b29ef450d5b90613b21684e3e067efbe895765bc133dd32abaf2971be88c78b')

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
