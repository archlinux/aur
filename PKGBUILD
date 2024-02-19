# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Math-BigInt-Lite
cpanauthor=PJACKLAM
pkgname='perl-math-bigint-lite'
pkgver=0.29
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
md5sums=('c18efa5635696703b14982f77fea3c33')
sha256sums=('47860dfca631978b71c4aa9991a1b29e4ecbaf361b5bb9eb395975b7ffcd77f5')
sha512sums=('07f108444628a9cc9e1214c05a5b13fbfbfd21c7d6661d65ab6c664512b34b6875d5f2253bd8945c849682d89e90dc4f29d1993051bcfe8db13ef1c0a4a4768b')

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
